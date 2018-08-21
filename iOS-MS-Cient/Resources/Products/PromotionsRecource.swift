//
//  PromotionsRecource.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 5/2/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class PromotionsRecource<T: Decodable> : Resource <ProductsSM> {
    override public func getURI() -> String {
        return "promotions"
    }
    
    public func price(priceProduct: PriceProduct, closure: @escaping (PromotionsPriceSM?, ErrorSM?) -> Swift.Void) {
        
        let filter = PriceConfigurationFilter()
        filter.addProduct(priceProduct: priceProduct)
        
        let data = filter.getDataForPromotions()
        var params: [String: String] = [:]
        
        params["products"] = data
        
        let url = client!.getGatewayUrl() + getURI() + "/products/byids"
        
        heandler.request(url: url, method: .post, parameters: params) { (items: PromotionsPriceSM?, error: ErrorSM?) in
            closure(items, error)
        }
    }
}
