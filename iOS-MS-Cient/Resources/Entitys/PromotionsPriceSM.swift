//
//  PromotionsPriceSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 8/21/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class PromotionsPriceSM: Entity, Decodable {
    public var data: [PromotionsPriceData]?
    public var status: String?
    public var ver: String?
}

public class PromotionsPriceData: Decodable {
    public var id: String?
    public var type: String?
    public var attributes: PromotionsPriceAttributes?
}

public class PromotionsPriceAttributes: Decodable {
    public var id: String?
    public var productId: String?
    public var promotionId: String?
    public var ruleId: String?
    public var discountValue: String?
    public var discountTypeId: String?
    public var title: String?
    public var discountTypeTitle: String?
    public var PercentageDiscountType: String?
    public var itemPrice: String?
    public var discountPrice: String?
    public var price: String?
}

