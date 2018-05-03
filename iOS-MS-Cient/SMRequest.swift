//
//  SMRequest.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 12/20/17.
//  Copyright © 2017 SphereMall. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

public class SMRequest: RequestAdapter, RequestRetrier {
    
    private let lock = NSLock()
    private let clientID : String!
    private var accessToken: String?
    private var secretKey: String!
    private var client: SMClient!
    private var tokenSevice: AuthToken!
    private var refreshToken: String!
    private var isRefreshing = false
    private lazy var requestsToRetry: [RequestRetryCompletion] = []
    private typealias RefreshCompletion = (_ succeeded: Bool, _ accessToken: String?) -> Void
    
    var manager : Alamofire.SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        return Alamofire.SessionManager(configuration: configuration)
    } ()
    
    public init(client: SMClient) {
        self.client = client
        self.tokenSevice = AuthToken(client: client)
        self.clientID = client.getClientId()
        self.accessToken = self.tokenSevice.token()
        manager.retrier = self
        manager.adapter = self
    }
    
    public func request<T:Decodable>(url: String, method: HTTPMethod, parameters: [String: String]?, headers:[String: String]? = nil, completionHandler: @escaping (T?, ErrorSM?) -> Swift.Void) {
        
        var modifiedheader = headers ?? [String : String] ()
        modifiedheader = ["User-Agent" : UIDevice.current.identifierForVendor!.uuidString]
        
        manager.request(url, method: method, parameters: parameters, encoding: URLEncoding.default , headers: modifiedheader)
            .validate(contentType: ["application/json"])
            .validate()
            .responseJSON { response in

                switch response.result {
                case .success:
                    if let value = response.result.value {
                        let json = JSON(value)
                        let data = try! json.rawData()
                        let decoder = JSONDecoder()

                        guard let items = try? decoder.decode(T.self , from: data) else {
                            completionHandler(nil, ErrorSM(code: 0, status: "Can't parse data for entity \(T.self)"))
                            return
                        }

                        completionHandler(items, nil)
                    }
                case .failure(let error):
                    let afError = error as? AFError
                    if let data = response.data {
                        let decoder = JSONDecoder()
                        guard let internalerror = try? decoder.decode(InternalErrorSM.self , from: data) else {
                            completionHandler(nil, ErrorSM(code: 0, status: "Can't parse data from responce"))
                            return
                        }
                        completionHandler(nil, ErrorSM(internalError: internalerror, code: afError?.responseCode ?? 0))
                        return
                    }
                    
                    completionHandler(nil, ErrorSM(code: afError?.responseCode,
                                                   status: afError?.errorDescription))
                }
        }
    }
    
    // MARK: - Private - Refresh Tokens
    
    private func refreshTokens(completion: @escaping RefreshCompletion) {
        guard !isRefreshing else { return }
        
        isRefreshing = true
        
        let deviceID = UIDevice.current.identifierForVendor!.uuidString
        let headers = ["User-Agent" : deviceID]
        let urlString = client.getGatewayUrl() + "admin/token?client_secret=\(client.getSecretKey())&client_id=\(client.getClientId())"
        
        manager.request(urlString, method: .post, parameters: nil, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { [weak self] response in
                guard let strongSelf = self else { return }
                
                if let value = response.result.value {
                    let json = JSON(value)
                    guard let accessToken = json["data"].first?.1["token"].string else {
                        completion(false, nil)
                        return
                    }
                    
                    strongSelf.tokenSevice.save(token: accessToken)
                    completion(true, accessToken)
                } else {
                    completion(false, nil)
                }
                
                strongSelf.isRefreshing = false
        }
    }
    
    // MARK: - RequestAdapter
    
    public func adapt(_ urlRequest: URLRequest) throws -> URLRequest {
        if let urlString = urlRequest.url?.absoluteString, urlString.hasPrefix(client.getGatewayUrl()) {
            var urlRequest = urlRequest
            urlRequest.setValue("Bearer " + (accessToken ?? "token"), forHTTPHeaderField: "Authorization")
            return urlRequest
        }
        
        return urlRequest
    }
    
    public func should(_ manager: SessionManager, retry request: Request, with error: Error, completion: @escaping RequestRetryCompletion) {

        lock.lock() ; defer { lock.unlock() }

        if let response = request.task?.response as? HTTPURLResponse, response.statusCode == 403 && accessToken == nil {

            let url = request.request!.url!.absoluteString
            if url.hasPrefix(client.getGatewayUrl() + "oauth/token") {
                completion(false, 0.0)
                return
            }

            requestsToRetry.append(completion)

            if !isRefreshing {
                refreshTokens { [weak self] succeeded, accessToken in
                    guard let strongSelf = self else { return }

                    strongSelf.lock.lock() ; defer { strongSelf.lock.unlock() }

                    if let accessToken = accessToken {
                        strongSelf.accessToken = accessToken
                    }

                    strongSelf.requestsToRetry.forEach { $0(succeeded, 0.0) }
                    strongSelf.requestsToRetry.removeAll()
                }
            }
        } else {
            completion(false, 0.0)
        }
    }
}

