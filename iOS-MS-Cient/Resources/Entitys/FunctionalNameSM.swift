//
//  FunctionalNameSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class FunctionalNameSM: Entity, Decodable {
    var data : [FunctionalNameData]?
    var error : Error?
    var meta: Meta?
}

public struct FunctionalNameData: Decodable {
    var attributes : FunctionalNameAttribute?
    var id : String?
    var type : String?
}

public struct FunctionalNameAttribute: Decodable {
    var code : String?
    var id : String?
    var title : String?
}
