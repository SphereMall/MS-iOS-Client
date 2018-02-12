//
//  VatsSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/23/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class VatsSM: Entity, Decodable {
    public var data : [VatsData]?
    public var error : Error?
    public var meta : Meta?
    public var success : Bool?
}

public struct VatsData: Decodable {
    public var attributes : VatsAttribute?
    public var id : String?
    public var type : String?
}

public struct VatsAttribute: Decodable {
    public var exclude : String?
    public var id : String?
    public var percent : String?
}
