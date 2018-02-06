//
//  InvoicesResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/23/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class InvoicesResource<InvoiceSM: Decodable> : Resource <InvoiceSM> {
    override public func getURI() -> String {
        return "invoices"
    }
}
