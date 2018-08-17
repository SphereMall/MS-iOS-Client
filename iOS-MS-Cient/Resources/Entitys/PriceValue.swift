//
//  PriceValue.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 8/15/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class PriceValueSM: Entity, Decodable {
    public var data: [PriceValueData]?
    public var status: String?
    public var ver: String?
}

public class PriceValueData: Decodable {
    public var id: Int?
    public var type: String?
    public var attributes: PriceValueDataAttributes?
}

public class PriceValueDataAttributes: Decodable {
    public var vatPercent: String?
    public var productId: String?
    public var prices: PriceValueDataAttributesPrices?
}

public class PriceValueDataAttributesPrices: Decodable {
    public var priceWithoutVat: String?
    public var priceWithVat: String?
}

public class PriceValue: Entity, Decodable {
    public var productId: Int?
    public var priceWithVat: Double?
    public var priceWithoutVat: Double?
    public var vatPercent: Double?
}
