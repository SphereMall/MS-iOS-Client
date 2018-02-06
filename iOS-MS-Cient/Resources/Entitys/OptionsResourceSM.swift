//
//  OptionsResourceSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class OptionsResourceSM: Entity, Decodable {
    var data : [OptionsResourceData]?
    var error : Error?
    var meta: Meta?
}

public struct OptionsResourceData: Decodable {
    var attributes : OptionsResourceAttribute?
    var id : String?
    var type : String?
}

public struct OptionsResourceAttribute: Decodable {
    var deprecatedCode : String?
    var descriptionField : String?
    var id : String?
    var orderNumber : String?
    var title : String?
    var visible : String?
}
