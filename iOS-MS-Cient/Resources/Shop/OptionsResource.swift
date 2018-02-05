//
//  OptionsResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/9/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class OptionsResource<OptionsResourceSM: Decodable> : Resource <OptionsResourceSM> {
    override func getURI() -> String {
        return "options"
    }
}
