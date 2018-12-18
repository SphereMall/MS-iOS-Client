//
//  MediaDisplayTypeSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 12/18/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class MediaDisplayTypeSM: Entity, Decodable {
    public var data : [MediaDisplayTypeData]?
    public var meta : Meta?
    public var status : String?
    public var ver : String?
    
    public init(data: [MediaDisplayTypeData]?, status: String?, meta: Meta?, ver: String?) {
        self.data = data
        self.meta = meta
        self.status = status
        self.ver = ver
    }
}

public class MediaDisplayTypeData: Decodable {
    public var attributes: MediaDisplayTypeAttributes?
    public var id : String?
    public var type : String?
}

public class MediaDisplayTypeAttributes: Decodable {
    public var id: String?
    public var title: String?
    public var description: String?
    public var cssClass: String?
    public var orderNumber: String?
    public var lastUpdate: String?
}
