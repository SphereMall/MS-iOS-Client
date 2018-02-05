//
//  EntitiesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class EntitiesSM: Entity, Decodable {
    var data : [EntitiesData]?
    var error : Error?
    var meta: Meta?

    struct EntitiesData: Decodable {
        var attributes : EntitiesAttribute?
        var id : String?
        var type : String?
    }
    
    struct EntitiesAttribute: Decodable  {
        var code : String?
        var displayField : String?
        var id : String?
        var inRelationWithFactor : String?
        var table : String?
        var title : String?
        var visible : String?
        var `where` : String?
    }
}
