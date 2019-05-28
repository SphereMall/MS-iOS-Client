//
//  Client.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 11/21/17.
//  Copyright © 2017 SphereMall. All rights reserved.
//

import Alamofire
import SwiftyJSON

public class SMClient: ServiceInjector {
    
    fileprivate var gatewayUrl: URL!
    fileprivate var clientId: String!
    fileprivate var secretKey: String!
    fileprivate var version = "v1"
    fileprivate var header = [String : String] ()
    fileprivate var username: String?
    fileprivate var password: String?
    
    public let userAgent = "SM_SDK_iOS_CLIENT"
    
    public init(gatewayUrl: String, clientId: String, secretKey: String, username: String? = nil, password: String? = nil) {
        super.init()
        self.gatewayUrl = URL(string:gatewayUrl)
        self.clientId = clientId
        self.secretKey = secretKey
        self.username = username
        self.password = password
    }
    
    public func getUser() -> String? {
        return self.username
    }
    
    public func getPassword() -> String? {
        return self.password
    }
    
    public func getGatewayUrl() -> String {
        return self.gatewayUrl.absoluteString
    }

    public func getClientId() -> String {
        return self.clientId
    }
    
    public func getSecretKey() -> String {
        return self.secretKey
    }

    public func getVersion() -> String {
        return self.version
    }
    
    @discardableResult public func setHeaders(_ headers: [String : String]) -> Self {
        self.header = headers
        return self
    }
    
    public func getHeaders() -> [String : String] {
        return self.header 
    }

    @discardableResult public func setVersion(_ version: String) -> Self {
        self.version = version
        return self
    }
}

