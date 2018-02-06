//
//  OrderFinalized.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class OrderFinalized: NSObject {
    
    public var items: [OrderItem]?
    public var subTotalVatPrice: String?
    public var totalVatPrice: String?
    public var subTotalPrice: String?
    public var totalPrice: String?
    public var totalPriceWithoutDelivery: String?
    
    internal let default_order_id = "-1"
    internal var id: String?
    internal var orderId: String?
    internal var delivery: String?
    internal var shippingAddress: String?
    internal var billingAddress: String?
    internal var paymentMethod: String?
    internal var user: UserModel?
    internal var statusId: String?
    internal var paymentStatusId: String?
    
    internal var client: SMClient!
    
    public init(client: SMClient) {
        id = default_order_id
        self.client = client
    }
    
    public final func setOrderData(order: OrdersAttributes) {
        //        if (get_called_class() != self::class) {
        //            throw new \InvalidArgumentException("Method can be call only by OrderFinalized entity");
        //        }
        
        self.id = order.id
        self.setProperties(order: order)
    }
    
    public func setProperties(order: OrdersAttributes) {
        
        self.orderId = order.orderId
        self.statusId = order.statusId
        self.paymentStatusId = order.paymentStatusId
        
        self.items = order.items
        
        self.subTotalVatPrice = order.subTotalVatPrice
        self.totalVatPrice = order.totalVatPrice
        self.subTotalPrice = order.subTotalPrice
        self.totalPrice = order.totalPrice
        self.totalPriceWithoutDelivery = order.totalPrice
        
        self.paymentMethod = order.paymentMethodId
        
        //        self.setPropertiesField(order.getPropertiesField())
        //        self.setAsyncProperties(order)
    }
    
    public func setProperties(order: BasketAttributes) {
        
        self.orderId = order.orderId
        self.statusId = order.statusId
        self.paymentStatusId = order.paymentStatusId
        
        //self.items = order.items
        
        self.subTotalVatPrice = order.subTotalVatPrice
        self.totalVatPrice = order.totalVatPrice
        self.subTotalPrice = order.subTotalPrice
        self.totalPrice = order.totalPrice
        self.totalPriceWithoutDelivery = order.totalPrice
        
        self.paymentMethod = order.paymentMethodId
        
        //        self.setPropertiesField(order.getPropertiesField())
        //        self.setAsyncProperties(order)
    }
    
    public func update(params: [String: String]? = [:]) {
        client.orders.update(id: getId(), data: params!) { (order, error) in
            self.client.orders.by(id: self.getId(), closure: { (orderWithItems, error) in
                order?.data?[0].attributes?.items = orderWithItems?.data?.first?.attributes?.items
                self.setOrderData(order: order!.data!.first!.attributes!)
            })
        }
    }
    
    public func getId() -> String {
        return self.id ?? "-1"
    }
    
    public func getOrderId() -> String? {
        return self.orderId
    }
    
    public func getDelivery() -> String? {
        return self.delivery
    }
    
    public func getShippingAddress() -> String? {
        return self.shippingAddress
    }
    
    public func getBillingAddress() -> String? {
        return self.billingAddress
    }
    
    public func getPaymentMethod() -> String? {
        return self.paymentMethod
    }
    
    public func getStatusId() -> String? {
        return self.statusId
    }
    
    public func getPaymentStatusId() -> String? {
        return self.paymentStatusId
    }
    
    public func getUser() -> UserModel? {
        return self.user
    }
}
