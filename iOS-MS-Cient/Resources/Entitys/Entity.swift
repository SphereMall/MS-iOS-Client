//
//  Entity.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/9/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public protocol EntityRebuilder {
    func rebuild() -> Self
}

public class Entity: EntityRebuilder {
    public struct Error: Decodable {
        public var message: String?
        public var error_code: String?
    }
    
    public func rebuild() -> Self {
        return self
    }
}

public struct Meta: Decodable {
    public var count: Int?
    public var limit: Int?
    public var offset: Int?
}
