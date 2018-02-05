//
//  Client.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 11/21/17.
//  Copyright © 2017 SphereMall. All rights reserved.
//

import Alamofire
import SwiftyJSON

enum NetworkErrorType : Int {
    case noInternet = 1
    case invalidToken = 2
    case accessTokenNotSet = 3
    case invalidRefreshToken = 4
    case incorrectCode = 5
    case invalidNumberType = 6
    case invalidNumber = 7
    case unsupportedCountryCode = 8
    case dataNotFoundCode = 9
    case unknownNetworkError = 99
    case IncorrectEmailOrPassword = 88
}

let SMNetworkDomain = "NetworkErrorDomain"

class SMClient: ServiceInjector {
    
    fileprivate var gatewayUrl: URL!
    fileprivate var clientId: String!
    fileprivate var secretKey: String!
    fileprivate var version = "v1"
    
    public let userAgent = "SM_SDK_iOS_CLIENT"
    
    init(gatewayUrl: String, clientId: String, secretKey: String) {
        super.init()
        self.gatewayUrl = URL(string:gatewayUrl)
        self.clientId = clientId
        self.secretKey = secretKey
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

    public func setVersion(version: String) {
        self.version = version
    }
}

