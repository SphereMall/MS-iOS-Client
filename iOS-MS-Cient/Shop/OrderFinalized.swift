//
//  OrderFinalized.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class OrderFinalized: NSObject {
    
    public var items: [ItemsData] = []
    public var subTotalVatPrice: String?
    public var totalVatPrice: String?
    public var subTotalPrice: String?
    public var totalPrice: String?
    public var totalPriceWithoutDelivery: String?
    public var itemsAmount: String = "0"
    public let default_order_id = "-1"
    public var id: String?
    public var orderId: String?
    public var delivery: String?
    public var shippingAddress: String?
    public var billingAddress: String?
    public var paymentMethod: String?
    public var user: UserModel?
    public var statusId: String?
    public var paymentStatusId: String?
    
    internal var client: SMClient!
    
    public init(client: SMClient) {
        id = default_order_id
        self.client = client
    }
    
    public final func setOrderData(order: OrdersAttributes) {
        self.id = order.id
        self.setProperties(order: order)
    }
    
    public func setProperties(order: OrdersAttributes) {
        
        self.orderId = order.orderId
        self.statusId = order.statusId
        self.paymentStatusId = order.paymentStatusId
        self.items = order.items ?? []
        self.itemsAmount = order.itemsAmount ?? "0"
        self.subTotalVatPrice = order.subTotalVatPrice
        self.totalVatPrice = order.totalVatPrice
        self.subTotalPrice = order.subTotalPrice
        self.totalPrice = order.totalPrice
        self.totalPriceWithoutDelivery = order.totalPrice
        self.paymentMethod = order.paymentMethodId
    }
    
    public func setProperties(order: BasketAttributes) {
        
        self.orderId = order.orderId
        self.statusId = order.statusId
        self.paymentStatusId = order.paymentStatusId
        self.items = order.items ?? []
        self.itemsAmount = order.itemsAmount ?? "0"
        self.subTotalVatPrice = order.subTotalVatPrice
        self.totalVatPrice = order.totalVatPrice
        self.subTotalPrice = order.subTotalPrice
        self.totalPrice = order.totalPrice
        self.totalPriceWithoutDelivery = order.totalPrice
        self.paymentMethod = order.paymentMethodId
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
