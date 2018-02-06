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
    
    public func getWishList(userId: String, closure: @escaping (WishlistSM?, NSError?) -> Swift.Void) {
        
        let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/wishlist/\(userId)"
        let parameters = self.getQueryParams()
        
        self.heandler.request(url: url, method: .get, parameters: parameters) { (items, error) in
            closure(items, error)
        }
    }
    
    public func addToWishList(userId: String, entityId: String, closure: @escaping (WishlistSM?, NSError?) -> Swift.Void) {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        formatter.string(from: Date())
        
        let data : [String: String] = ["userId" : userId, "productId": entityId, "createDate" : formatter.string(from: Date())]

        self.client!.wishListItems.create(data: data) { (item, error) in
            closure(item, error)
        }
    }
    
    public func removeFromWishList(userId: String, entityId: String, closure: @escaping (Bool?, NSError?) -> Swift.Void) {
        let predicateUser = Predicate(field: "userId", op: .equal, value: userId)
        let predicateProduct = Predicate(field: "productId", op: .equal, value: entityId)
        client!.wishListItems
            .filters(predicates: [predicateUser, predicateProduct])
            .first { (item, error) in
                if item != nil {
                    self.client!.wishListItems.delete(id: item!.data!.first?.id ?? "", closure: { (isSuccesed, error) in
                        closure(isSuccesed, error)
                    })
                } else {
                    closure(false, error)
                }
        }
    }
}

