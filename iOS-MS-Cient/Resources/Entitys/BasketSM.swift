//
//  BasketSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class BasketSM: Entity, Decodable {
    public var data: [BasketData]?
    public var error : Error?
    public var success : Bool?
    public var ver : Int?
    public var meta: Meta?
}

public struct BasketData: Decodable {
    public var id : String?
    public var attributes : BasketAttributes?
    public var type : String?
}

public class BasketAttributes: Decodable {
    public var id: String?
    public var orderId: String?
    public var userId: String?
    public var statusId: String?
    public var paymentStatusId: String?
    public var paymentId: String?
    public var itemsAmount: String?
    public var deliveryProviderId: String?
    public var deliveryCost: String?
    public var subTotalVatPrice: String?
    public var totalVatPrice: String?
    public var discountPrice: String?
    public var totalDiscountPrice: String?
    public var subTotalPrice: String?
    public var totalPrice: String?
    public var paymentMethodId: String?
    public var createDate: String?
    public var updateDate: String?
    public var shippingAddressId: String?
    public var billingAddressId: String?
    public var deliveryTime: String?
    public var latitude: String?
    public var longitude: String?
    public var deliveryStatusId: String?
    public var currencyId: String?
    public var additionalInfo: String?
    public var orderComment: String?
    public var coupon: String?
    public var totalPriceWithoutDelivery: String?
    public var items: [OrderItem]?
}
