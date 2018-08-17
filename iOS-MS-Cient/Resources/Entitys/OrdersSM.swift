//
//  OrdersSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/19/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class OrdersSM: Entity, Decodable {
    public var data: [OrdersData]?
    public var meta : Meta?
    public var status : String?
    public var ver : String?
}

public struct OrdersData: Decodable {
    public var id : String?
    public var attributes : OrdersAttributes?
    public var type : String?
}

public class OrdersAttributes: Decodable {
    public var type : String?
    public var attributes : String?
    public var paymentStatusId : String?
    public var deliveryProviderId : String?
    public var totalPrice : String?
    public var billingAddressId : String?
    public var shippingAddressId : String?
    public var deliveryStatusId : String?
    public var orderComment : String?
    public var itemsAmount : String?
    public var deliveryCost : String?
    public var totalDiscountPrice : String?
    public var updateDate : String?
    public var totalVatPrice : String?
    public var paymentMethodId : String?
    public var latitude : String?
    public var currencyId : String?
    public var subTotalVatPrice : String?
    public var statusId : String?
    public var id : String?
    public var deliveryTime : String?
    public var longitude : String?
    public var additionalInfo : String?
    public var coupon : String?
    public var discountPrice : String?
    public var paymentId : String?
    public var subTotalPrice : String?
    public var createDate : String?
    public var orderId : String?
    public var userId : String?
    public var items: [OrdersItemData]?
    public var paymentMethods : [PaymentMethod]?
}

public struct OrdersItemData: Decodable {
    public var id: String?
    public var type: String?
    public var attributes: OrdersAttributes?
    public var relationships: ObjectRelationships?
}

public struct OrderItem: Decodable {
    public var id : String?
    public var orderId : String?
    public var productId : String?
    public var amount : String?
    public var promotionId : String?
    public var compound : String?
    public var itemPrice : String?
    public var totalDiscountPrice : String?
    public var itemPriceWithDiscount : String?
    public var vatId : String?
    public var itemVatPrice : String?
    public var itemVatExcludePrice : String?
    public var totalPrice : String?
    public var attributes : String?
    public var attributesKey : String?
    public var attributesHash : String?
    public var priceTypeId : String?
    public var products: [ProductsData]?
}

public struct OrderImages: Decodable {
    public var id : String?
    public var objectId : String?
    public var title : String?
    public var imageName : String?
    public var path : String?
    public var orderNumber : String?
    public var imageTypeId : String?
    public var visible : String?
}

public struct PaymentMethod: Decodable {
    public var id : String?
    public var websiteId : String?
    public var providerId : String?
    public var title : String?
    public var code : String?
    public var shortDescription : String?
    public var icon : String?
    public var orderNumber : String?
    public var active : String?
}

