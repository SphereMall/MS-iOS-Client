//
//  OrdersHistorySM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class OrdersHistorySM: Entity, Decodable {
    public var data: [OrdersAttributes]?
    public var meta : Meta?
    public var status : String?
    public var ver : String?
}

