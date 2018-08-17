//
//  PriceProduct.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 8/14/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class PriceProduct {
    
    public var productId: Int
    public var priceTypeId: Int
    public var attributes: [AttributesResourceData]
    public var options: [ProductOptionsAttributes]
    
    public init(productId: Int, priceTypeId: Int, attributes: [AttributesResourceData], options: [ProductOptionsAttributes]) {
        self.productId = productId
        self.priceTypeId = priceTypeId
        self.attributes = attributes
        self.options = options
    }
}
