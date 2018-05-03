//
//  MediaTypesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/12/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class MediaTypesSM: Entity, Decodable {
    public var data : [MediaTypesData]?
    public var meta: Meta?
    public var status : String?
    public var ver : String?
}

public struct MediaTypesData: Decodable {
    public var attributes  : MediaTypesAttributes?
    public var id : String?
    public var type : String?
}

public struct MediaTypesAttributes: Decodable  {
    public var id : String?
    public var title : String?
    public var description : String?
    public var `class` : String?
    public var orderNumber : String?
}
