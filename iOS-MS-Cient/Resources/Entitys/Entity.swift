//
//  Entity.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/9/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class Entity {    
    struct Error: Decodable {
        
    }
    
    struct Meta: Decodable {
        var count: Int?
        var limit: Int?
        var offset: Int?
    }
}

