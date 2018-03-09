//
//  WishListItemsResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/10/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class WishListItemsResource<T: Decodable>: Resource<WishlistSM>  {
    override public func getURI() -> String {
        return "wishlistitems"
    }
    
    public func getWishList(userId: String, limit: Int, offset: Int, closure: @escaping ([WishListObjectSM]?, NSError?) -> Swift.Void) {

        let predicate = Predicate(field: "userId", op: .equal, value: userId)

        self.filter(predicate: predicate).limit(limit: limit, offset: offset).all { (items: WishlistSM?, error: NSError?) in
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
            
            self.client!.products.ids(ids: ids).limit(limit: limit, offset: offset).all(closure: { (products: ProductsSM?, error) in
                var items : [WishListObjectSM] = []
                for i in 0...wishlistData.count - 1 {
                    items.append(WishListObjectSM(item: wishlistData[i].attributes!, object: products?.data![i] as AnyObject))
                }
                
                closure(items, error)
            })
        }
    }
    
    public func addToWishList(userId: String, objectId: String, entity: String = "products", closure: @escaping (ProductsSM?, NSError?) -> Swift.Void) {
        
        let predicate = Predicate(field: "code", op: .equal, value: entity)
        client!.etities.filter(predicate: predicate).get(id: entity) { (entity, error) in
            
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
    
    public func addToWishList(userId: String, objectId: String, entity: Int = 1, closure: @escaping (ProductsSM?, NSError?) -> Swift.Void) {
        
        let data : [String: String] = ["userId": userId, "objectId": objectId, "entity" : entity.description]
        let url = String(self.client!.getGatewayUrl() + self.getURI())
        
        self.heandler.request(url: url, method: .post, parameters: data) { (item, error) in
            closure(item, error)
        }
    }
    
    public func removeFromWishList(wishlistId: String, closure: @escaping (Bool?, NSError?) -> Swift.Void) {
        self.delete(id: wishlistId) { (issuccess, error) in
            closure(issuccess, error)
        }
    }
    
    public func removeFromWishList(objectId: String, entity: String = "products", closure: @escaping (Bool?, NSError?) -> Swift.Void) {
        
        let codePredicate = Predicate(field: "code", op: .equal, value: entity)
        let objectIdPredicate = Predicate(field: "objectId", op: .equal, value: objectId)
        
        client!.etities.filters(predicates: [codePredicate]).first { (entity, error) in
            guard let entityId = entity?.data?.first?.id else {
                closure(nil, NSError(domain: "entityId not found", code: 403, userInfo: nil))
                return
            }
            
            let entityIdPredicate = Predicate(field: "entityId", op: .equal, value: entityId)
            self.filters(predicates: [objectIdPredicate, entityIdPredicate]).first(closure: { (wishlist, error) in
                guard let wishlistId = wishlist?.data?.first?.id else {
                    closure(nil, NSError(domain: "wishlistId not found", code: 403, userInfo: nil))
                    return
                }
                
                let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/\(wishlistId.description)"
                self.heandler.request(url: url, method: .delete, parameters: nil) { (item: EmptySM?, error: NSError?) in
                    closure(item?.success, error)
                }
            })
        }
    }
}
