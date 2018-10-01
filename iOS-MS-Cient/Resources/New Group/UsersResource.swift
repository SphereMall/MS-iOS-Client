//
//  User.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 11/27/17.
//  Copyright © 2017 SphereMall. All rights reserved.
//

import UIKit

public class UsersResource<T: Decodable>: Resource<UserSM> {
    public override func getURI() -> String {
        return "users"
    }
    
    public func subscribe(email: String, name: String = "", closure: @escaping (UserSM?, ErrorSM?) -> Swift.Void) {
    
        self.filter(predicate: IsUserEmail(email: email).asFilter())
            .limit(limit: 1)
            .all { (users, error) in
                let user = users?.data?.first
                if user == nil {
                    let newUser: [String: String] = ["email": email, "name": name, "guid": UUID().uuidString, "isSubscriber": "1"]
                    self.create(data: newUser, closure: { (user, error) in
                        closure(user, error)
                    })
                } else {
                
                    if IsUserSubscriber().isSatisfiedBy(user: user!.attributes!) {
                        closure(users, nil)
                        return
                    }
                    
                    if user?.attributes?.id != nil {
                        self.update(id: user!.attributes!.id!,
                                    data: ["isSubscriber" : "1"],
                                    closure: { (user, error) in
                                       closure(user, error)
                        })
                    }
                }
        }
    }
    
    public func unsubscribe(guid: String, closure: @escaping (UserSM?, ErrorSM?) -> Swift.Void) {
        fields(fields: ["isSubscriber"])
            .filter(predicate: Predicate(field: "guid", op: .equal, value: guid))
            .limit(limit: 1)
            .all { (user, error) in
                let usr = user?.data?.first
                if usr == nil {
                    closure(user, nil)
                    return
                } else if !IsUserSubscriber().isSatisfiedBy(user: usr!.attributes!) {
                    closure(user, nil)
                    return
                }

                self.update(id: usr!.attributes!.id!, data: ["isSubscriber" : "0"], closure: { (user, error) in
                    closure(user, error)
                })
        }
    }
    
    public func uploadPushesToken(token: String, userId: String, closure: @escaping (Bool?, ErrorSM?) -> Swift.Void ) {
        
        let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/devices/\(userId)"
        let data = ["userToken" : token]
        
        self.heandler.request(url: url, method: .put, parameters: data) { (item: EmptySM?, error: ErrorSM?) in
            if item?.status == "OK" {
                closure(true, error)
            } else {
                closure(false, error)
            }
        }
    }
    
    public func setAddress(addressId: String = "0", userId: String, params: [String: String], closure: @escaping (AddressSM?, ErrorSM?) -> Swift.Void) {
        
        var parameters: [String : String] = params
        
        if addressId == "0" {
            client!.address.create(data: params, closure: { (address, error) in
                guard let id = address?.data?.first?.id else {
                    closure(address, error)
                    return
                }
                
                let userParams: [String : String] = ["defaultAddressId": id]
                self.client!.user.update(id: userId.description, data: userParams, closure: { (user, error) in
                    if user != nil {
                        closure(address, error)
                    } else {
                        closure(nil, error)
                    }
                })
            })
        } else {
            _ = parameters.updateValue(userId.description, forKey: "userId")
            self.client!.address.update(id: addressId.description, data: parameters, closure: { (address, error) in
                closure(address, error)
            })
        }
    }
    
    public func get(deviceId: String, closure: @escaping (UserSM?, ErrorSM?) -> Void) {

        let headers = ["User-Agent" : deviceId]
        
        let url = self.client!.getGatewayUrl() + getURI() + "/devices/\(deviceId)"
        
        let parameters = ["client_secret" : client!.getSecretKey(),
                          "client_id" : client!.getClientId()]
        
        heandler.request(url: url, method: .get, parameters: parameters, headers: headers) { (item: SlimUserSM?, error: ErrorSM?) in
            if error != nil {
                closure(nil, error)
            } else {
                guard let id = item?.data?.first?.attributes?.userId else {
                    closure(nil, ErrorSM(code: 404, status: "userId not found"))
                    return
                }
                
                self.get(id: id, closure: { (user: UserSM?, error: ErrorSM?) in
                    closure(user, error)
                })
            }
        }
    }
}

