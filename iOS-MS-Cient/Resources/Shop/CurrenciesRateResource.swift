//
//  CurrenciesRateResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class CurrenciesRateResource<CurrencyRateSM: Decodable> : Resource <CurrencyRateSM> {
    override public func getURI() -> String {
        return "currenciesrate"
    }
}
