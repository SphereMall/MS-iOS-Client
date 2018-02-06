//
//  InvoicesResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/23/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class InvoiceSM: Entity, Decodable {
    var data : [InvoiceData]?
    var error : Error?
    var meta: Meta?
}

public struct InvoiceData: Decodable {
    var attributes : InvoiceAttribute?
    var id : String?
    var type : String?
}

public struct InvoiceAttribute: Decodable {
    var createDate : String?
    var id : String?
    var invoiceHash : String?
    var orderId : String?
    var path : String?
}
