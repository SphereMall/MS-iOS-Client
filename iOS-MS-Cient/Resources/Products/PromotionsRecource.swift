//
//  PromotionsRecource.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 5/2/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class PromotionsRecource<T: Decodable> : Resource <ProductsSM>  {
    override public func getURI() -> String {
        return "promotions"
    }
}
