//
//  CurrencyRateSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class CurrencyRateSM: Entity, Decodable {
    var data : [CurrencyRateData]?
    var error : Error?
    var meta: Meta?

    struct CurrencyRateData: Decodable {
        var attributes : CurrencyRateAttribute?
        var id : String?
        var type : String?
    }
    
    struct CurrencyRateAttribute: Decodable {
        var fromId : String?
        var id : String?
        var lastUpdate : String?
        var rate : String?
        var toId : String?
    }
    
}
