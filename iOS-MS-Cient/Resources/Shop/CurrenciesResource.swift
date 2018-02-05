//
//  CurrenciesResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class CurrenciesResource<CurrenciSM: Decodable> : Resource <CurrenciSM> {

    override func getURI() -> String {
        return "currencies"
    }
}
