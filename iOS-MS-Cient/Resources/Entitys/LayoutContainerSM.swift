//
//  LayoutContainerSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 5/10/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public class LayoutContainerSM: Entity, Decodable {
    var data: [LayoutContainerData]?
}

public struct LayoutContainerData: Decodable {
    public var id: String?
    public var type: String?
    public var attributes: LayoutContainerAttributes?
    public var relationships: ObjectRelationships?
    
    public init(_ include: IncludItem, includes: [IncludItem]) {
        guard let object = include.item as? LayoutContainerAttributes else { return }
        self.attributes = object
        self.type = include.type
        self.id = include.id
        self.relationships = include.relationships
        rebuild(included: includes)
    }
    
    public mutating func rebuild(included: [IncludItem]) {
        
        guard let data = relationships?.layoutContainerItems?.data else { return }
        
        var items: [LayoutContainerItemsData] = []
        for item in data  {
            let include = included.first(where: { (includeItem) -> Bool in
                if includeItem.type == "layoutContainerItems" && (includeItem.item as? LayoutContainerItemsAttributes)?.id == item.id {
                    return true
                }
                return false
            })
            
            if let itm = include {
                items.append(LayoutContainerItemsData(itm, includes: included))
            }
        }
        
        attributes?.layoutContainerItems = items
    }
}

public struct LayoutContainerAttributes: Decodable {
    public var id: String?
    public var containerId: String?
    public var objectId: String?
    public var orderNumber: String?
    public var layoutContainerItems: [LayoutContainerItemsData]?
}

