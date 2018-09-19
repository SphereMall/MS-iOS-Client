//
//  PriceRangeFilter.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class PriceRangeFilter: GridFilterElement {
    public init(from: String, to: String) {
        super.init(values: ["[\(from),\(to)]"])
        self.name = "priceRange"
    }
}
