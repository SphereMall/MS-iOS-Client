//
//  FunctionalNameSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class FunctionalNameSM: Entity, Decodable {
    var data : [FunctionalNameData]?
    var error : Error?
    var meta: Meta?
    
    struct FunctionalNameData: Decodable {
        var attributes : FunctionalNameAttribute?
        var id : String?
        var type : String?
    }
    
    struct FunctionalNameAttribute: Decodable {
        var code : String?
        var id : String?
        var title : String?
    }
}
