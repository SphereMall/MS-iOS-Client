//
//  Entity.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/9/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class Entity {
    public struct Error: Decodable {
        
    }
}

public struct Meta: Decodable {
    public var count: Int?
    public var limit: Int?
    public var offset: Int?
}

