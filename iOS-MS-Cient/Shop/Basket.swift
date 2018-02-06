//
//  Basket.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class Basket: OrderFinalized {
    
    private var updateParams : [String: String] = [:]
    
    public init(client: SMClient, userId: String? = nil) {
        super.init(client: client)
        if userId != nil {
            self.id = userId
            self.get(id: userId!, closure: { (basket, error) in
                if basket != nil {
                    self.setProperties(order: basket!.data!.first!.attributes!)
                }
            })
        }
    }
    
    public func get(id: String, closure: @escaping (BasketSM?, NSError?) -> Swift.Void) {
        client.basket.get(id: id) { (order, error) in
            if order != nil {
                self.setProperties(order: order!.data!.first!.attributes!)
            }
            closure(order, error)
        }
    }
    
    public func add(predicate: BasketPredicate, closure: @escaping (BasketSM?, NSError?) -> Swift.Void) {
        
        let params = queryParams(predicates: [predicate])
        
        if getId() == default_order_id {
            self.createBasket(closure: { (basket, error) in
                if basket != nil {
                    self.client.basket.create(data: params) { (order, error) in
                        if order != nil {
                            self.setProperties(order: order!.data!.first!.attributes!)
                        }
                        closure(order, error)
                    }
                } else {
                    closure(nil, error)
                }
            })
        } else {
            client.basket.create(data: params) { (order, error) in
                if order != nil {
                    self.setProperties(order: order!.data!.first!.attributes!)
                }
                closure(order, error)
            }
        }
    }
    
    public func remove(predicate: BasketPredicate, closure: @escaping (BasketSM?, NSError?) -> Swift.Void) {
        
        if id == default_order_id {
            closure(nil, NSError(domain: "Can not delete items. Shop is not created.", code: 404, userInfo: nil))
            return
        }
        
        let params = queryParams(predicates: [predicate])
        client.basket.removeAllItems(params: params) { (order, error) in
            if order != nil {
                self.setProperties(order: order!.data!.first!.attributes!)
            }
            closure(order, error)
        }
    }
    
    public func update(predicate: BasketPredicate, closure: @escaping (BasketSM?, NSError?) -> Swift.Void) {
        
        let params = queryParams(predicates: [predicate])
        let margedParams = updateParams.merging(params) { (_, new) in new }
        
        if getId() == default_order_id {
            self.createBasket(closure: { (basket, error) in
                self.client.basket.update(id: self.getId(), data: margedParams) { (order, error) in
                    if order != nil {
                        self.setProperties(order: order!.data!.first!.attributes!)
                        self.updateParams.removeAll()
                        closure(order, error)
                    } else {
                        closure(order, error)
                    }
                }
            })
        } else {
            client.basket.update(id: getId(), data: margedParams) { (order, error) in
                if order != nil {
                    self.setProperties(order: order!.data!.first!.attributes!)
                    self.updateParams.removeAll()
                    closure(order, error)
                }
            }
        }
    }
    
    public func setPaymentMethod(paymentMethod: String) -> Basket {
        self.update(params: ["paymentMethodId": paymentMethod])
        return self
    }
    
    public func setShippingAddress(address: inout AddressModel) -> Basket {
        var address = address
        setAddress(address: &address, addressKey: "shippingAddress")
        return self
    }
    
    public func setBillingAddress(address: inout AddressModel) -> Basket {
        var address = address
        setAddress(address: &address, addressKey: "billingAddress")
        return self
    }
    
    public func setAddress(address: inout AddressModel, addressKey: String) {
        var address = address
        if address.id != nil {
            client.address.create(data: ["":""], closure: { (addressItem, error) in
                if addressItem != nil {
                    address = addressItem!.data!.first!.attributes!
                    self.update(params: ["\(addressKey)Id": address.id!])
                }
            })
        }
    }
    
    public func setUser(user: UserModel) -> OrderFinalized {
        if user.id == nil {
            fatalError("Can set user. User id is empty.")
        }
        
        update(params: ["userId": user.id!])
        return self
    }
    
    public func createBasket(closure: @escaping (BasketSM?, NSError?) -> Swift.Void) {
        client.basket.new(data: nil) { (basket, error) in
            self.id = basket?.data?.first?.id
        }
    }
    
    public func queryParams(predicates: [BasketPredicate]) -> [String: String] {
        var params: [String: String] = [:]
        params["userId"] = getId()
        
        var products = "["
        for predicate in predicates {
            products = products + predicate.make() + ","
        }
        
        products = String(products.dropLast())
        products = products + "]"
        params["products"] = products
        return params
    }
}
