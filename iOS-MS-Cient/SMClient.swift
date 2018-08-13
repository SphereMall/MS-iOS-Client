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
    
    public let userAgent = "SM_SDK_iOS_CLIENT"
    
    public init(gatewayUrl: String, clientId: String, secretKey: String) {
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

