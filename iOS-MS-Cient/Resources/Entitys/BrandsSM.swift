//
//  BrandsSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class BrandsSM: Entity, Decodable {

    var data : [BrandsData]?
    var error : Error?
    var meta: Meta?

    struct BrandsData: Decodable {
        var attributes : AttributeBrand?
        var id : String?
        var type : String?
    }
    
    struct AttributeBrand: Decodable {
        var id : String?
        var image : String?
        var logo : String?
        var title : String?
        var urlCode : String?
        var visible : String?
    }
}
