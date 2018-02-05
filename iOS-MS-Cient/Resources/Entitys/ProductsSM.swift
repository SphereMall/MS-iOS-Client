//
//  ProductsSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 12/18/17.
//  Copyright © 2017 SphereMall. All rights reserved.
//

import UIKit

class ProductsSM: Entity, Decodable {    
    var data: [ProductsData]?
    var error : Error?
    var success : Bool?
    var ver : Int?
    var meta: Meta?
}

struct ProductsData: Decodable {
    var id : String?
    var attributes : ProductsAttributes?
    var type : String?
}

struct ProductsAttributes: Decodable  {
    var articleNumber : String?
    var authorizationGroupId : String?
    var brandId : String?
    var deliveryProviderId : String?
    var disable : String?
    var fullDescription : String?
    var functionalNameId : String?
    var id : String?
    var importedId : String?
    var isMain : String?
    var lastUpdate : String?
    var oldPrice : String?
    var price : String?
    var priceExclVat : String?
    var purchasePrice: String?
    var rating: String?
    var reviewAmount: String?
    var sellingLine: String?
    var seoDescription: String?
    var seoKeywords: String?
    var seoTitle: String?
    var shortDescription: String?
    var title: String?
    var titleMask: String?
    var urlCode: String?
    var useTitleMask: String?
    var vatId: String?
    var visible: String?
    var websiteId: String?
    var images: [ProductImages]?
        
    struct ProductImages: Decodable {
        var id : String?
        var imageName : String?
        var path : String?
        var title : String?
        var visible : String?
        var objectId : String?
    }
}
