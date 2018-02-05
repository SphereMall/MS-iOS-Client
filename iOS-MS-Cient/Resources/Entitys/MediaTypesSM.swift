//
//  MediaTypesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/12/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class MediaTypesSM: Entity, Decodable {

    var data : [MediaTypesData]?
    var error : Error?
    var meta: Meta?

    struct MediaTypesData: Decodable {
        
        var attributes  : MediaTypesAttributes?
        var id : String?
        var type : String?

        struct MediaTypesAttributes: Decodable  {
            var id : String?
            var title : String?
            var description : String?
            var `class` : String?
            var orderNumber : String?
        }
    }
}
