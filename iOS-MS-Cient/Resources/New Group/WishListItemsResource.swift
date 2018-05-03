//
//  WishListItemsResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/10/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit
import Alamofire

public class WishListItemsResource<T: Decodable>: Resource<WishlistSM>  {
    override public func getURI() -> String {
        return "wishlistitems"
    }
    
    public func add(userId: String, objectId: String, entity: EntityType, closure: @escaping (WishlistSM?, ErrorSM?) -> Swift.Void) {
        add(userId: userId, objectId: objectId, entity: Int(entity.rawValue)!) { (item, error) in
            closure(item, error)
        }
    }
    
    public func get(userId: String, limit: Int, offset: Int, closure: @escaping ([WishListObjectSM]?, ErrorSM?) -> Swift.Void) {
        
        let predicate = Predicate(field: "userId", op: .equal, value: userId)
        
        self.filter(predicate: predicate).limit(limit: limit, offset: offset).all { (items: WishlistSM?, error: ErrorSM?) in
            guard let wishlistData = items?.data else {
                closure(nil, error)
                return
            }
            
            var ids: [String] = []
            for id in wishlistData {
                if let id = id.attributes?.objectId {
                    ids.append(id)
                }
            }
            
            self.client!.products.ids(ids: ids).limit(limit: limit, offset: offset).fullAll(closure: { (products: ProductsSM?, error) in
                var items : [WishListObjectSM] = []
                
                guard let data = products?.data else {
                    closure(nil, ErrorSM(code: 404, status: "data not found"))
                    return
                }
                
                for i in 0...data.count - 1 {
                    let item = wishlistData.first{ $0.attributes?.objectId == products?.data?[i].id }
                    if let unwrappedItem = item?.attributes {
                        items.append(WishListObjectSM(item: unwrappedItem,
                                                      type: products?.data?[i].type,
                                                      object: products?.data?[i].attributes as AnyObject))
                    }
                }
                
                closure(items, error)
            })
        }
    }
    
    public func add(userId: String, objectId: String, entity: String = "products", closure: @escaping (WishlistSM?, ErrorSM?) -> Swift.Void) {
        
        let predicate = Predicate(field: "code", op: .equal, value: entity)
        
        client!.etities.filter(predicate: predicate).first { (entity, error) in
            
            if entity != nil {
                guard let id = entity?.data?.first?.id else { return}
                let data : [String: String] = ["userId": userId, "objectId": objectId, "entityId" : id]
                let url = String(self.client!.getGatewayUrl() + self.getURI())
                
                self.heandler.request(url: url, method: .post, parameters: data) { (item, error) in
                    closure(item, error)
                }
            }
        }
    }
    
    public func add(userId: String, objectId: String, entity: Int, closure: @escaping (WishlistSM?, ErrorSM?) -> Swift.Void) {
        
        let data : [String: String] = ["userId": userId, "objectId": objectId, "entityId" : entity.description]
        let url = String(self.client!.getGatewayUrl() + self.getURI())
        
        heandler.request(url: url, method: .post, parameters: data) { (item, error) in
            closure(item, error)
        }
    }
    
    public func remove(wishlistId: String, closure: @escaping (Bool?, ErrorSM?) -> Swift.Void) {
        self.delete(id: wishlistId) { (issuccess, error) in
            closure(issuccess, error)
        }
    }
    
    public func remove(userId: String, objectId: String, entity: String = "products", closure: @escaping (Bool?, ErrorSM?) -> Swift.Void) {
        
        let codePredicate = Predicate(field: "code", op: .equal, value: entity)
        let objectIdPredicate = Predicate(field: "objectId", op: .equal, value: objectId)
        
        client!.etities.filters(predicates: [codePredicate]).first { (entity, error) in
            guard let entityId = entity?.data?.first?.id else {
                closure(nil, ErrorSM(code: 404, status: "entityId not found"))
                return
            }
            
            let entityIdPredicate = Predicate(field: "entityId", op: .equal, value: entityId)
            let userIdrPedicate = Predicate(field: "userId", op: .equal, value: userId)
            self.filters(predicates: [objectIdPredicate, entityIdPredicate, userIdrPedicate]).first(closure: { (wishlist, error) in
                guard let wishlistId = wishlist?.data?.first?.id else {
                    closure(nil, ErrorSM(code: 404, status: "wishlistId not found"))
                    return
                }
                
                let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/\(wishlistId.description)"
                self.heandler.request(url: url, method: .delete, parameters: nil) { (item: EmptySM?, error: ErrorSM?) in
                    if item?.status == "OK" {
                        closure(true, error)
                    } else {
                        closure(false, error)
                    }
                }
            })
        }
    }
    
    public func remove(userId: String, objectId: String, entity: EntityType, closure: @escaping (Bool?, ErrorSM?) -> Swift.Void) {
        
        let objectIdPredicate = Predicate(field: "objectId", op: .equal, value: objectId)        
        let entityIdPredicate = Predicate(field: "entityId", op: .equal, value: entity.rawValue)
        let userIdrPedicate   = Predicate(field: "userId", op: .equal, value: userId)
        
        self.filters(predicates: [objectIdPredicate, entityIdPredicate, userIdrPedicate]).first(closure: { (wishlist, error) in
            guard let wishlistId = wishlist?.data?.first?.id else {
                closure(nil, ErrorSM(code: 404, status: "wishlistId not found"))
                return
            }
            
            let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/\(wishlistId.description)"
            self.heandler.request(url: url, method: .delete, parameters: nil) { (item: EmptySM?, error: ErrorSM?) in
                if item?.status == "OK" {
                    closure(true, error)
                } else {
                    closure(false, error)
                }
            }
        })
    }
}
