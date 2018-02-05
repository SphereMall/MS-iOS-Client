//
//  WishlistObjectSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/11/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class WishlistSM: Entity, Decodable {
    var data: [WishlistAttributes]?
    var error : Error?
    var success : Bool?
    var ver : Int?
    var meta: Meta?
}

struct WishlistAttributes: Decodable {
    var id: String?
    var attributes: WishListItemSM?
    var type: String?
}

class WishListItemSM: Decodable {
    var id: String?
    var userId: String?
    var createDate: String?
    var updateDate: String?
    var products: [ProductsAttributes]?
}