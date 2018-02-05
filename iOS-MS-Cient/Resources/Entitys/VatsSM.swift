//
//  VatsSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/23/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class VatsSM: Entity, Decodable {
    
    var data : [VatsData]?
    var error : Error?
    var meta : Meta?

    struct VatsData: Decodable {
        var attributes : VatsAttribute?
        var id : String?
        var type : String?
    }
    
    struct VatsAttribute: Decodable {
        var exclude : String?
        var id : String?
        var percent : String?
    }
}
