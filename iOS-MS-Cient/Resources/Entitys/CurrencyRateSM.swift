//
//  CurrencyRateSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class CurrencyRateSM: Entity, Decodable {
    public var data : [CurrencyRateData]?
    public var error : Error?
    public var meta: Meta?
    public var success : Bool?
}

public struct CurrencyRateData: Decodable {
    public var attributes : CurrencyRateAttribute?
    public var id : String?
    public var type : String?
}

public struct CurrencyRateAttribute: Decodable {
    public var fromId : String?
    public var id : String?
    public var lastUpdate : String?
    public var rate : String?
    public var toId : String?
}
