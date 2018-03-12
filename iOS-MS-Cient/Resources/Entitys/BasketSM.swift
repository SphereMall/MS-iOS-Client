//
//  BasketSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class BasketSM: Entity, Decodable  {
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
//
//public class BasketAttributes: Decodable {
//    public var id: String?
//    public var orderId: String?
//    public var userId: String?
//    public var statusId: String?
//    public var paymentStatusId: String?
//    public var paymentId: String?
//    public var itemsAmount: String?
//    public var deliveryProviderId: String?
//    public var deliveryCost: String?
//    public var subTotalVatPrice: String?
//    public var totalVatPrice: String?
//    public var discountPrice: String?
//    public var totalDiscountPrice: String?
//    public var subTotalPrice: String?
//    public var totalPrice: String?
//    public var paymentMethodId: String?
//    public var createDate: String?
//    public var updateDate: String?
//    public var shippingAddressId: String?
//    public var billingAddressId: String?
//    public var deliveryTime: String?
//    public var latitude: String?
//    public var longitude: String?
//    public var deliveryStatusId: String?
//    public var currencyId: String?
//    public var additionalInfo: String?
//    public var orderComment: String?
//    public var coupon: String?
//    public var totalPriceWithoutDelivery: String?
//    public var items: [OrderItem]?
//}

public struct BasketAttributes : Decodable {
    public let subTotalVatPrice : String?
    public let totalPrice : String?
    public let orderId : String?
    public let latitude : String?
    public let deliveryCost : String?
    public let id : String?
    public let currencyId : String?
    public let paymentStatusId : String?
    public let ultraCartOrder : String?
    public let totalFullDiscountPriceWithVat : String?
    public let deliveryStatusId : String?
    public let billingAddressId : String?
    public let totalDiscountPrice : String?
    public let additionalInfo : String?
    public let coupon : String?
    public let totalPriceWithoutDelivery : String?
    public let updateDate : String?
    public let subTotalPrice : String?
    public let totalVatPrice : String?
    public let ultraCart : String?
    public let totalBasketPriceWithoutDiscount : String?
    public let paymentMethodId : String?
    public let totalPromotionPrice : String?
    public let statusId : String?
    public let longitude : String?
    public let paymentId : String?
    public let discountPrice : String?
    public let createDate : String?
    public let deliveryTime : String?
    public let orderComment : String?
    public let itemsAmount : String?
    public let shippingAddressId : String?
    public let items : [OrderItem]?
    public let userId : String?
    public let deliveryProviderId : String?
    
    public enum CodingKeys: String, CodingKey {
        case subTotalVatPrice = "subTotalVatPrice"
        case totalPrice = "totalPrice"
        case orderId = "orderId"
        case latitude = "latitude"
        case deliveryCost = "deliveryCost"
        case id = "id"
        case currencyId = "currencyId"
        case paymentStatusId = "paymentStatusId"
        case ultraCartOrder = "ultraCartOrder"
        case totalFullDiscountPriceWithVat = "totalFullDiscountPriceWithVat"
        case deliveryStatusId = "deliveryStatusId"
        case billingAddressId = "billingAddressId"
        case totalDiscountPrice = "totalDiscountPrice"
        case additionalInfo = "additionalInfo"
        case coupon = "coupon"
        case totalPriceWithoutDelivery = "totalPriceWithoutDelivery"
        case updateDate = "updateDate"
        case subTotalPrice = "subTotalPrice"
        case totalVatPrice = "totalVatPrice"
        case ultraCart = "ultraCart"
        case totalBasketPriceWithoutDiscount = "totalBasketPriceWithoutDiscount"
        case paymentMethodId = "paymentMethodId"
        case totalPromotionPrice = "totalPromotionPrice"
        case statusId = "statusId"
        case longitude = "longitude"
        case paymentId = "paymentId"
        case discountPrice = "discountPrice"
        case createDate = "createDate"
        case deliveryTime = "deliveryTime"
        case orderComment = "orderComment"
        case itemsAmount = "itemsAmount"
        case shippingAddressId = "shippingAddressId"
        case items = "items"
        case userId = "userId"
        case deliveryProviderId = "deliveryProviderId"
    }
    
    public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        if let subTotalVatPriceInt = try? values.decodeIfPresent(Int.self, forKey: .subTotalVatPrice) {
            subTotalVatPrice = subTotalVatPriceInt?.description
        } else {
            subTotalVatPrice = try values.decodeIfPresent(String.self, forKey: .subTotalVatPrice)
        }
        
        if let totalPriceInt = try? values.decodeIfPresent(Int.self, forKey: .totalPrice) {
            totalPrice = totalPriceInt?.description
        } else {
            totalPrice = try values.decodeIfPresent(String.self, forKey: .totalPrice)
        }
        
        if let deliveryCostInt = try? values.decodeIfPresent(Int.self, forKey: .deliveryCost) {
            deliveryCost = deliveryCostInt?.description
        } else {
            deliveryCost = try values.decodeIfPresent(String.self, forKey: .deliveryCost)
        }
        
        if let idInt = try? values.decodeIfPresent(Int.self, forKey: .id) {
            id = idInt?.description
        } else {
            id = try values.decodeIfPresent(String.self, forKey: .id)
        }
        
        if let totalFullDiscountPriceWithVatInt = try? values.decodeIfPresent(Int.self, forKey: .totalFullDiscountPriceWithVat) {
            totalFullDiscountPriceWithVat = totalFullDiscountPriceWithVatInt?.description
        } else {
            totalFullDiscountPriceWithVat = try values.decodeIfPresent(String.self, forKey: .totalFullDiscountPriceWithVat)
        }
        
        if let currencyIdInt = try? values.decodeIfPresent(Int.self, forKey: .currencyId)  {
            currencyId = currencyIdInt?.description
        } else {
            currencyId = try values.decodeIfPresent(String.self, forKey: .currencyId)
        }
        
        if let deliveryStatusIdInt = try? values.decodeIfPresent(Int.self, forKey: .deliveryStatusId) {
            deliveryStatusId = deliveryStatusIdInt?.description
        } else {
            deliveryStatusId = try values.decodeIfPresent(String.self, forKey: .deliveryStatusId)
        }
        
        if let totalDiscountPriceInt = try? values.decodeIfPresent(Int.self, forKey: .totalDiscountPrice) {
            totalDiscountPrice = totalDiscountPriceInt?.description
        } else {
            totalDiscountPrice = try values.decodeIfPresent(String.self, forKey: .totalDiscountPrice)
        }
        
        if let totalPriceWithoutDeliveryInt = try? values.decodeIfPresent(Int.self, forKey: .totalPriceWithoutDelivery) {
            totalPriceWithoutDelivery = totalPriceWithoutDeliveryInt?.description
        } else {
            totalPriceWithoutDelivery = try values.decodeIfPresent(String.self, forKey: .totalPriceWithoutDelivery)
        }
        
        if let totalBasketPriceWithoutDiscountInt = try? values.decodeIfPresent(Int.self, forKey: .totalBasketPriceWithoutDiscount) {
            totalBasketPriceWithoutDiscount = totalBasketPriceWithoutDiscountInt?.description
        } else {
            totalBasketPriceWithoutDiscount = try values.decodeIfPresent(String.self, forKey: .totalBasketPriceWithoutDiscount)
        }
        
        if let paymentMethodIdInt = try? values.decodeIfPresent(Int.self, forKey: .paymentMethodId) {
            paymentMethodId = paymentMethodIdInt?.description
        } else {
            paymentMethodId = try values.decodeIfPresent(String.self, forKey: .paymentMethodId)
        }
        
        if let statusIdInt = try? values.decodeIfPresent(Int.self, forKey: .statusId) {
            statusId = statusIdInt?.description
        } else {
            statusId = try values.decodeIfPresent(String.self, forKey: .statusId)
        }
        
        if let subTotalPriceInt = try? values.decodeIfPresent(Int.self, forKey: .subTotalPrice) {
            subTotalPrice = subTotalPriceInt?.description
        } else {
            subTotalPrice = try values.decodeIfPresent(String.self, forKey: .subTotalPrice)
        }
        
        if let totalVatPriceInt = try? values.decodeIfPresent(Int.self, forKey: .totalVatPrice) {
            totalVatPrice = totalVatPriceInt?.description
        } else {
            totalVatPrice = try values.decodeIfPresent(String.self, forKey: .totalVatPrice)
        }
        
        if let totalPromotionPriceInt = try? values.decodeIfPresent(Int.self, forKey: .totalPromotionPrice) {
            totalPromotionPrice = totalPromotionPriceInt?.description
        } else {
            totalPromotionPrice = try values.decodeIfPresent(String.self, forKey: .totalPromotionPrice)
        }
        
        if let discountPriceInt = try? values.decodeIfPresent(Int.self, forKey: .discountPrice) {
            discountPrice = discountPriceInt?.description
        } else {
            discountPrice = try values.decodeIfPresent(String.self, forKey: .discountPrice)
        }
        
        if let itemsAmountInt = try? values.decodeIfPresent(Int.self, forKey: .itemsAmount) {
            itemsAmount = itemsAmountInt?.description
        } else {
            itemsAmount = try values.decodeIfPresent(String.self, forKey: .itemsAmount)
        }
        
        if let userIdInt = try? values.decodeIfPresent(Int.self, forKey: .userId) {
            userId = userIdInt?.description
        } else {
            userId = try values.decodeIfPresent(String.self, forKey: .userId)
        }
        
        orderId = try values.decodeIfPresent(String.self, forKey: .orderId)
        latitude = try values.decodeIfPresent(String.self, forKey: .latitude)
        paymentStatusId = try values.decodeIfPresent(String.self, forKey: .paymentStatusId)
        ultraCartOrder = try values.decodeIfPresent(String.self, forKey: .ultraCartOrder)
        billingAddressId = try values.decodeIfPresent(String.self, forKey: .billingAddressId)
        additionalInfo = try values.decodeIfPresent(String.self, forKey: .additionalInfo)
        coupon = try values.decodeIfPresent(String.self, forKey: .coupon)
        updateDate = try values.decodeIfPresent(String.self, forKey: .updateDate)
        ultraCart = try values.decodeIfPresent(String.self, forKey: .ultraCart)
        longitude = try values.decodeIfPresent(String.self, forKey: .longitude)
        paymentId = try values.decodeIfPresent(String.self, forKey: .paymentId)
        createDate = try values.decodeIfPresent(String.self, forKey: .createDate)
        deliveryTime = try values.decodeIfPresent(String.self, forKey: .deliveryTime)
        orderComment = try values.decodeIfPresent(String.self, forKey: .orderComment)
        shippingAddressId = try values.decodeIfPresent(String.self, forKey: .shippingAddressId)
        items = try values.decodeIfPresent([OrderItem].self, forKey: .items)
        deliveryProviderId = try values.decodeIfPresent(String.self, forKey: .deliveryProviderId)
    }
}
