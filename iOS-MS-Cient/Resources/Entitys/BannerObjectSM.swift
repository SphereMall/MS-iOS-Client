//
//  BannerObjectSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 5/10/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public class BannerObjectSM: Entity, Decodable {
    var data: [BannerObjectData]?
}

public struct BannerObjectData: Decodable {
    public var id: String?
    public var type: String?
    public var attributes: BannerObjectAttributes?
    public var relationships: ObjectRelationships?
    
    public init(_ include: IncludItem) {
        guard let object = include.item as? BannerObjectAttributes else { return }
        self.attributes = object
        self.type = include.type
        self.id = include.id
        self.relationships = include.relationships
    }
}

public struct BannerObjectAttributes: Decodable {
    public var id: String?
    public var backgroundImage: String?
    public var textColor: String?
    public var pageUrl: String?
    public var blockOpacity: String?
    public var cssClass: String?
    public var alignDescription: String?
    public var buttonLabel: String?
    public var backgroundColor: String?
    public var additionalMedia: String?
    public var backgroundMobileImage: String?
    public var fullBannerClickable: String?
    public var titleTag: String?
    public var title: String?
    public var html: String?
}
