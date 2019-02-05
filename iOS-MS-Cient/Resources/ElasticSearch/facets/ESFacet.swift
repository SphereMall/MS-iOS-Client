//
//  ESFacet.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 2/1/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public class ESFacet: Decodable {
    public let data: ESFacetData?
    public let service: String?
    public let status: String?
    public let version: String?
}

public class ESFacetData: Decodable {
    public let attributes: [ESFacetDataAttributes]?
    public let brands: [ESFacetDataBrands]?
    public let factorValues: [ESFacetDataFactorValues]?
    public let functionalNames: [ESFacetDataFunctionalNames]?
    public let priceRange: [Int]?
}

public class ESFacetDataAttributes: Decodable {
    public let amount: Int?
    public let attributeGroupId: String?
    public let attributeId: String?
    public let attributesCssClass: String?
    public let code: String?
    public let cssClass: String?
    public let description: String?
    public let displayType: String?
    public let id: Int?
    public let image: String?
    public let orderNumber: String?
    public let orderNumberAttributeValues: String?
    public let showInSpecList: String?
    public let title: String?
    public let useInFilter: String?
    public let value: String?
    public let valueTitle: String?
}

public class ESFacetDataBrands: Decodable {
    public let id: Int?
    public let urlCode: String?
    public let title: String?
    public let image: String?
    public let logo: String?
    public let visible: String?
    public let amount: Int?
}

public class ESFacetDataFactorValues: Decodable {
    public let amount: Int?
    public let id: Int?
}

public class ESFacetDataFunctionalNames: Decodable {
    public let id: Int?
    public let code: String?
    public let title: String?
    public let amount: Int?
}

public class ESFacetDataPriceRange: Decodable {
    
}
