//
//  DeliveryProviderSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/23/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class DeliveryProviderSM: Entity, Decodable  {
    var data : [DeliveryProviderData]?
    var error : Error?
    var meta: Meta?

    struct DeliveryProviderData: Decodable {
        var attributes : DeliveryProviderAttribute!
        var id : String!
        var type : String!
    }
    
    struct DeliveryProviderAttribute: Decodable {
        var `class` : String?
        var cost : String?
        var deliveryDestinationId : String?
        var freeDeliveryPrice : String?
        var id : String?
        var isDefault : String?
        var isWinningPrize : String?
        var maxPrice : String?
        var minPrice : String?
        var msUrl : String?
        var name : String?
        var visible : String?
    }
}
