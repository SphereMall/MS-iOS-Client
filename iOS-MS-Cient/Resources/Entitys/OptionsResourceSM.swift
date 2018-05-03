//
//  OptionsResourceSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class OptionsResourceSM: Entity, Decodable {
    public var data : [OptionsResourceData]?
    public var meta: Meta?
    public var status : String?
    public var ver : String?
}

public struct OptionsResourceData: Decodable {
    public var attributes : OptionsResourceAttribute?
    public var id : String?
    public var type : String?
}

public struct OptionsResourceAttribute: Decodable {
    public var deprecatedCode : String?
    public var descriptionField : String?
    public var id : String?
    public var orderNumber : String?
    public var title : String?
    public var visible : String?
}
