//
//  CurrenciSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class CurrenciSM: Entity, Decodable  {
    public var data : [CurrenciData]?
    public var meta: Meta?
    public var status : String?
    public var ver : String?
}

public struct CurrenciData: Decodable {
    public var attributes : CurrenciAttribute?
    public var id : String?
    public var type : String?
}

public struct CurrenciAttribute: Decodable {
    public var active : String?
    public var code : String?
    public var defaultField : String?
    public var id : String?
    public var symbol : String?
    public var title : String?
}
