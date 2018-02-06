//
//  BasketSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class BasketSM: Entity, Decodable {
    var data: [BasketData]?
    var error : Error?
    var success : Bool?
    var ver : Int?
    var meta: Meta?
}

public struct BasketData: Decodable {
    var id : String?
    var attributes : BasketAttributes?
    var type : String?
}

public class BasketAttributes: Decodable {
    var id: String?
    var orderId: String?
    var userId: String?
    var statusId: String?
    var paymentStatusId: String?
    var paymentId: String?
    var itemsAmount: String?
    var deliveryProviderId: String?
    var deliveryCost: String?
    var subTotalVatPrice: String?
    var totalVatPrice: String?
    var discountPrice: String?
    var totalDiscountPrice: String?
    var subTotalPrice: String?
    var totalPrice: String?
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
    var totalPriceWithoutDelivery: String?
    var items: [OrderItem]?
}
