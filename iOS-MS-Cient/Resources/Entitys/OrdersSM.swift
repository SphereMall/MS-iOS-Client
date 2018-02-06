//
//  OrdersSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/19/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class OrdersSM: Entity, Decodable {
    var data: [OrdersData]?
    var error : Error?
    var success : Bool?
    var ver : Int?
    var meta: Meta?
}

public struct OrdersData: Decodable {
    var id : String?
    var attributes : OrdersAttributes?
    var type : String?
}

public class OrdersAttributes: Decodable {
    var type : String?
    var attributes : String?
    var paymentStatusId : String?
    var deliveryProviderId : String?
    var totalPrice : String?
    var billingAddressId : String?
    var shippingAddressId : String?
    var deliveryStatusId : String?
    var orderComment : String?
    var itemsAmount : String?
    var deliveryCost : String?
    var totalDiscountPrice : String?
    var updateDate : String?
    var totalVatPrice : String?
    var paymentMethodId : String?
    var latitude : String?
    var currencyId : String?
    var subTotalVatPrice : String?
    var statusId : String?
    var id : String?
    var deliveryTime : String?
    var longitude : String?
    var additionalInfo : String?
    var coupon : String?
    var discountPrice : String?
    var paymentId : String?
    var subTotalPrice : String?
    var createDate : String?
    var orderId : String?
    var userId : String?
    var items: [OrderItem]?
    var paymentMethods : [PaymentMethod]?
}

public struct OrderItem: Decodable {
    var id : String?
    var orderId : String?
    var productId : String?
    var amount : String? //       !!!!!
    var promotionId : String?
    var compound : String?
    var itemPrice : String? //       !!!!!
    var totalDiscountPrice : String? //       !!!!!
    var itemPriceWithDiscount : String? //       !!!!!
    var vatId : String?
    var itemVatPrice : String? //       !!!!!
    var itemVatExcludePrice : String? //       !!!!!
    var totalPrice : String? //       !!!!!
    var attributes : String?
    var attributesKey : String?
    var attributesHash : String?
    var priceTypeId : String?
    var products : [ProductsAttributes]?
    var images : [OrderImages]?
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

