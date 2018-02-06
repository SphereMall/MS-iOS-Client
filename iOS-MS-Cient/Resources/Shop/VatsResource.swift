//
//  VatsResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/23/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class VatsResource<VatsSM: Decodable> : Resource <VatsSM> {
    override public func getURI() -> String {
        return "vat"
    }
}
