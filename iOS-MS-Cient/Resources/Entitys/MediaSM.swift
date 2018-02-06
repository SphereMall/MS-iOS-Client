//
//  MediaSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/12/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class MediaSM: Entity, Decodable {
    var data : [MediaData]?
    var error : Error?
    var meta: Meta?
}

public struct MediaData: Decodable {
    var attributes  : MediaAttributes?
    var id : String?
    var type : String?
}

public struct MediaAttributes: Decodable  {
    var objectId : String?
    var title : String?
    var imageName : String?
    var orderNumber : String?
    var imageTypeId : String?
    var visible : String?
    var path : String?
}
