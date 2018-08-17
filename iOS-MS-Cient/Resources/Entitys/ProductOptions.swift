//
//  ProductOptions.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 8/13/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public struct ProductOptions: Decodable {
    public var type: String?
    public var id: String?
    public var attributes: ProductOptionsAttributes?
    public var relationships: ObjectRelationships?
    
    public init(include: IncludItem) {
        guard let object = include.item as? ProductOptionsAttributes else { return }
        self.attributes = object
        self.type = include.type
        self.id = include.id
        self.relationships = include.relationships
    }
}

public struct ProductOptionsAttributes: Decodable {
    public var id: String?
    public var title: String?
    public var description: String?
    public var orderNumber: String?
    public var objectId: String?
}
