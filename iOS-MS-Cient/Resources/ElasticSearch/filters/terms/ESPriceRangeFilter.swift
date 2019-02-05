//
//  ESPriceRangeFilter.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 2/4/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public class ESPriceRangeFilter: RangeFilter<Double> {
    
    public override init(attribute: String) {
        super.init(attribute: attribute)
    }
    
    
    public func setRange(minPrice: Double, maxPrice: Double) {
        addOption(optionName: RangeType.GT.rawValue, value: minPrice)
        addOption(optionName: RangeType.LT.rawValue, value: maxPrice)
    }
}
