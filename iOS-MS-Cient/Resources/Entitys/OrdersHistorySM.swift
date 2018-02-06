//
//  OrdersHistorySM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class OrdersHistorySM: Entity, Decodable {
    var data: [OrdersAttributes]?
    var error : Error?
    var success : Bool?
    var ver : Int?
    var meta: Meta?
}
