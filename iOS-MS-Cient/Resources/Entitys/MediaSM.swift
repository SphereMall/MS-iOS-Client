//
//  MediaSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/12/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class MediaSM: Entity, Decodable {
    public var data : [MediaData]?
    public var error : Error?
    public var meta: Meta?
    public var success : Bool?
}

public struct MediaData: Decodable {
    public var attributes  : MediaAttributes?
    public var id : String?
    public var type : String?
}

public struct MediaAttributes: Decodable  {
    public var objectId : String?
    public var title : String?
    public var imageName : String?
    public var orderNumber : String?
    public var imageTypeId : String?
    public var visible : String?
    public var path : String?
}
