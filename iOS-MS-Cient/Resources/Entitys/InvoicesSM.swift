//
//  InvoicesResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/23/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class InvoiceSM: Entity, Decodable {
    public var data : [InvoiceData]?
    public var error : Error?
    public var meta: Meta?
    public var success : Bool?
}

public struct InvoiceData: Decodable {
    public var attributes : InvoiceAttribute?
    public var id : String?
    public var type : String?
}

public struct InvoiceAttribute: Decodable {
    public var createDate : String?
    public var id : String?
    public var invoiceHash : String?
    public var orderId : String?
    public var path : String?
}
