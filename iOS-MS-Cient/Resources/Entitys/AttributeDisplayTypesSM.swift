//
//  AttributeDisplayTypes.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class AttributeDisplayTypesSM: Entity, Decodable {
    
    var data : [AttributeDisplayTypesData]?
    var error : Error?
    var meta: Meta?

    struct AttributeDisplayTypesData: Decodable {
        var attributes : Attribute?
        var id : String?
        var links : [LinksData]?
        var relationships : [RelationshipsData]?
        var type : String?
        
        struct LinksData: Decodable  {
            
        }
        
        struct RelationshipsData: Decodable  {
            
        }
        
        struct Attribute: Decodable {
            var id : String!
            var name : String!
        }
    }
}
