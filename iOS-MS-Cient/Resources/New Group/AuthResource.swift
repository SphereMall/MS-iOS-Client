//
//  AuthResource.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 2/6/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class AuthResource<T: Decodable> : Resource <DocumentsSM> {
    
    override public func getURI() -> String {
        return "oauth/token"
    }
    
    public func token(email: String, password: String, closure: @escaping (AuthorizationSM?, ErrorSM? ) -> Swift.Void) {
        
        let deviceID = UIDevice.current.identifierForVendor!.uuidString
        let headers = ["User-Agent" : deviceID]
        
        let url = self.client!.getGatewayUrl() + "auth/token"
        
        let parameters = ["client_secret" : client!.getSecretKey(),
                          "client_id" : client!.getClientId(),
                          "login_password": password,
                          "login_email": email]
        
        heandler.request(url: url, method: .post, parameters: parameters, headers: headers) { (item: AuthorizationSM?, error: ErrorSM?) in
            closure(item, error)
        }
    }
    
    public func login(email: String, password: String, closure: @escaping (UserSM?, ErrorSM? ) -> Swift.Void) {
        
        let deviceID = UIDevice.current.identifierForVendor!.uuidString
        let headers = ["User-Agent" : deviceID]
        
        let url = self.client!.getGatewayUrl() + "auth/token"
        
        let parameters = ["client_secret" : client!.getSecretKey(),
                          "client_id" : client!.getClientId(),
                          "login_password": password,
                          "login_email": email]
        
        heandler.request(url: url, method: .post, parameters: parameters, headers: headers) { (item: AuthorizationSM?, error: ErrorSM?) in
            if let _ = item?.data?.first?.accessToken {
                let filter = Filter()
                filter.addFilter(field: "email", op: .equal, value: email)
                filter.addFilter(field: "password", op: .equal, value: password)
                self.client?.user.filter(filter: filter).all(closure: { (user, error) in
                    closure(user, nil)
                })
            } else {
                closure(nil, error)
            }
        }
    }
    
    public func loginDeprecated(email: String, password: String, closure: @escaping (AdminSM?, ErrorSM? ) -> Swift.Void) {
        
        let deviceID = UIDevice.current.identifierForVendor!.uuidString
        let headers = ["User-Agent" : deviceID]
        
        let url = self.client!.getGatewayUrl() + getURI()
        
        let parameters = ["client_secret" : client!.getSecretKey(),
                          "client_id" : client!.getClientId(),
                          "login_pass": password,
                          "login_email": email]
        
        heandler.request(url: url, method: .post, parameters: parameters, headers: headers) { (item: AdminSM?, error: ErrorSM?) in
            closure(item, error)
        }
    }
}
