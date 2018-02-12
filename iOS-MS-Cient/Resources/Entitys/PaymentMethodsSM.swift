//
//  PaymentMethods.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class PaymentMethodsSM: Entity, Decodable {
    public var data : [PaymentData]?
    public var error : Error?
    public var meta : Meta?
    public var success : Bool?
}

public struct PaymentAttributes: Decodable  {
    public var active : String?
    public var code : String?
    public var icon : String?
    public var id : String?
    public var orderNumber : String?
    public var providerId : String?
    public var shortDescription : String?
    public var title : String?
    public var websiteId : String?
}

public struct PaymentData: Decodable {
    public var attributes : PaymentAttributes?
    public var id : String?
    public var type : String?
}
