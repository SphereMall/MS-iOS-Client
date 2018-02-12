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
    public var error : Error?
    public var success : Bool?
    public var ver : Int?
    public var meta: Meta?
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
    public var items: [OrderItem]?
    public var paymentMethods : [PaymentMethod]?
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
    public var products : [ProductsAttributes]?
    public var images : [OrderImages]?
}

public struct OrderImages: Decodable {
    var id : String?
    var objectId : String?
    var title : String?
    var imageName : String?
    var path : String?
    var orderNumber : String?
    var imageTypeId : String?
    var visible : String?
}

public struct PaymentMethod: Decodable {
    var id : String?
    var websiteId : String?
    var providerId : String?
    var title : String?
    var code : String?
    var shortDescription : String?
    var icon : String?
    var orderNumber : String?
    var active : String?
}

