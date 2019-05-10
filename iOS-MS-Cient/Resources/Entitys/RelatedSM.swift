//
//  RelatedSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 5/10/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public class RelatedSM: Entity, Decodable {
    var data: [RelatedData]?
}

public struct RelatedData: Decodable {
    public var id: String?
    public var type: String?
    public var attributes: RelatedAttributes?
    public var relationships: ObjectRelationships?
    
    public init(_ include: IncludItem) {
        guard let object = include.item as? RelatedAttributes else { return }
        self.attributes = object
        self.type = include.type
        self.id = include.id
        self.relationships = include.relationships
    }
}

public struct RelatedAttributes: Decodable {
    public var id: String?
    public var title: String?
    public var buttonText: String?
    public var pageUrl: String?
    public var backgroundImage: String?
    public var choosingIcon: String?
    public var text: String?
    public var name: String?
    public var titleTag: String?
    public var backgroundMobileImage: String?
    public var cssClass: String?
    public var backgroundColor: String?
    public var subtitle: String?
    public var fullSlideIsClickable: String?
}
