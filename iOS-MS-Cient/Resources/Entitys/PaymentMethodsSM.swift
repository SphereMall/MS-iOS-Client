//
//  PaymentMethods.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class PaymentMethodsSM: Entity, Decodable {
    var data : [PaymentData]?
    var error : Error?
    var meta : Meta?
}

public struct PaymentAttributes: Decodable  {
    var active : String?
    var code : String?
    var icon : String?
    var id : String?
    var orderNumber : String?
    var providerId : String?
    var shortDescription : String?
    var title : String?
    var websiteId : String?
}

public struct PaymentData: Decodable {
    var attributes : PaymentAttributes?
    var id : String?
    var type : String?
}
