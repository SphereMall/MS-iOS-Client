//
//  CurrenciSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class CurrenciSM: Entity, Decodable  {
    var data : [CurrenciData]?
    var error : Error?
    var meta: Meta?

    struct CurrenciData: Decodable {
        var attributes : CurrenciAttribute?
        var id : String?
        var type : String?
    }
    
    struct CurrenciAttribute: Decodable {
        var active : String?
        var code : String?
        var defaultField : String?
        var id : String?
        var symbol : String?
        var title : String?
    }
}
