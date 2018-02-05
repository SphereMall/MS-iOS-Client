//
//  EntitiesResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/9/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class EntitiesResource<ProductsSM: Decodable> : Resource <ProductsSM> {
    override func getURI() -> String {
        return "entities"
    }
}
