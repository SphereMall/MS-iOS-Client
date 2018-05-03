//
//  FunctionalNameSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class FunctionalNameSM: Entity, Decodable {
    public var data : [FunctionalNameData]?
    public var meta: Meta?
    public var status : String?
    public var ver : String?
}

public struct FunctionalNameData: Decodable {
    public var attributes : FunctionalNameAttribute?
    public var id : String?
    public var type : String?
}

public struct FunctionalNameAttribute: Decodable {
    public var code : String?
    public var id : String?
    public var title : String?
}
