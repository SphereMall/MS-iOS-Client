//
//  DeliveryProviderSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/23/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class DeliveryProviderSM: Entity, Decodable  {
    public var data : [DeliveryProviderData]?
    public var error : Error?
    public var meta: Meta?
    public var success : Bool?
}

public struct DeliveryProviderData: Decodable {
    public var attributes : DeliveryProviderAttribute!
    public var id : String!
    public var type : String!
}

public struct DeliveryProviderAttribute: Decodable {
    public var `class` : String?
    public var cost : String?
    public var deliveryDestinationId : String?
    public var freeDeliveryPrice : String?
    public var id : String?
    public var isDefault : String?
    public var isWinningPrize : String?
    public var maxPrice : String?
    public var minPrice : String?
    public var msUrl : String?
    public var name : String?
    public var visible : String?
}
