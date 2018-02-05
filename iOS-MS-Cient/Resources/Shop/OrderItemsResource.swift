//
//  OrderItemsResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class OrderItemsResource<ProductsSM: Decodable>: Resource<ProductsSM> {
    override func getURI() -> String {
        return "orderitems"
    }
}
