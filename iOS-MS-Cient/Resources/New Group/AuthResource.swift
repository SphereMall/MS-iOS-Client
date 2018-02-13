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
    
    public func login(email: String, password: String, closure: @escaping (AdminSM?, NSError? ) -> Swift.Void) {
        
        let deviceID = UIDevice.current.identifierForVendor!.uuidString
        let headers = ["User-Agent" : deviceID]
        
        let url = self.client!.getGatewayUrl() + getURI()
        
        let parameters = ["client_secret" : client!.getSecretKey(),
                          "client_id" : client!.getClientId(),
                          "login_pass": password,
                          "login_email": email]
        
        heandler.request(url: url, method: .post, parameters: parameters, headers: headers) { (item: AdminSM?, error: NSError?) in
            closure(item, error)
        }
    }
}
