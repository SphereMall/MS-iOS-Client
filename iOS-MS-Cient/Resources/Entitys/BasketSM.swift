//
//  BasketSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class BasketSM: Entity, Decodable {
    var data: [BasketData]?
    var error : Error?
    var success : Bool?
    var ver : Int?
    var meta: Meta?
}

struct BasketData: Decodable {
    var id : String?
    var attributes : BasketAttributes?
    var type : String?
}

class BasketAttributes: Decodable {
    var id: String?
    var orderId: String?
    var userId: String?
    var statusId: String?
    var paymentStatusId: String?
    var paymentId: String?
    var itemsAmount: Int?
    var deliveryProviderId: String?
    var deliveryCost: Int?
    var subTotalVatPrice: Int?
    var totalVatPrice: Int?
    var discountPrice: Int?
    var totalDiscountPrice: Int?
    var subTotalPrice: Int?
    var totalPrice: Int?
    var paymentMethodId: String?
    var createDate: String?
    var updateDate: String?
    var shippingAddressId: String?
    var billingAddressId: String?
    var deliveryTime: String?
    var latitude: String?
    var longitude: String?
    var deliveryStatusId: String?
    var currencyId: String?
    var additionalInfo: String?
    var orderComment: String?
    var coupon: String?
    var totalPriceWithoutDelivery: Int?
    var items: [OrderItem]?
}
