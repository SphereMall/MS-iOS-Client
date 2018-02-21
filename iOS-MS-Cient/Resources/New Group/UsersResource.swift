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
    
    public func subscribe(email: String, name: String = "", closure: @escaping (UserSM?, NSError?) -> Swift.Void) {
    
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
    
    public func unsubscribe(guid: String, closure: @escaping (UserSM?, NSError?) -> Swift.Void) {
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
    
    public func getWishList(userId: String, closure: @escaping (ProductsSM?, NSError?) -> Swift.Void) {
        
        let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/wishlist/\(userId)"
        let parameters = self.getQueryParams()
        
        self.heandler.request(url: url, method: .get, parameters: parameters) { (items, error) in
            closure(items, error)
        }
    }
    
    public func addToWishList(userId: String, objectId: String, entity: String = "products", closure: @escaping (ProductsSM?, NSError?) -> Swift.Void) {
        
        let data : [String: String] = ["objectId": objectId, "entity" : entity]
        let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/wishlist/\(userId)"
        
        self.heandler.request(url: url, method: .post, parameters: data) { (item, error) in
            closure(item, error)
        }
    }
    
    public func removeFromWishList(userId: String, objectId: String, entity: String = "products", closure: @escaping (Bool?, NSError?) -> Swift.Void) {
        
        let data : [String: String] = ["objectId": objectId, "entity" : entity]
        let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/wishlist/\(userId)"
        
        self.heandler.request(url: url, method: .delete, parameters: data) { (item: EmptySM?, error: NSError?) in
            closure(item?.success, error)
        }
    }
    
    public func uploadPushesToken(token: String, userId: String, closure: @escaping (Bool?, NSError?) -> Swift.Void ) {
        
        let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/devices/\(userId)"
        let data = ["userToken" : token]
        
        self.heandler.request(url: url, method: .put, parameters: data) { (item: EmptySM?, error: NSError?) in
            closure(item?.success, error)
        }
    }
    
    public func setAddress(addressId: String = "0", userId: String, params: [String: String], closure: @escaping (AddressSM?, NSError?) -> Swift.Void) {
        
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
}

