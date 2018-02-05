//
//  FunctionalNamesResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/9/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class FunctionalNamesResource<ProductsSM: Decodable> : Resource <ProductsSM> {
    override func getURI() -> String {
        return "functionalnames"
    }
}
