//
//  VatsSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/23/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class VatsSM: Entity, Decodable {
    var data : [VatsData]?
    var error : Error?
    var meta : Meta?
}

public struct VatsData: Decodable {
    var attributes : VatsAttribute?
    var id : String?
    var type : String?
}

public struct VatsAttribute: Decodable {
    var exclude : String?
    var id : String?
    var percent : String?
}
