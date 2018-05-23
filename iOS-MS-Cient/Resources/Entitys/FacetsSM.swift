//
//  FacetsSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 3/28/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class FacetsSM: Entity, Decodable {
    public var data : FacetsData?
    public var meta : Meta?
    public var status : String?
    public var ver : String?
}

public struct FacetsData: Decodable {
    public var attributes : [FacetsAttribute]?
    public var priceRange : FacetsPriceRange?
}

public struct FacetsPriceRange: Decodable {
    public var minPrice : Int?
    public var maxPrice : Int?
    public var amounts : Int?
}

public struct FacetsAttribute: Decodable {
    public var attributes : String?
    public var id: Int?
    public var value: String?
    public var valueTitle: String?
    public var cssClass: String?
    public var attributeId: String?
    public var image: String?
    public var code: String?
    public var displayType: String?
    public var title: String?
    public var orderNumber: String?
    public var description: String?
    public var showInSpecList: String?
    public var useInFilter: String?
    public var attributeGroupId: String?
    public var attributesCssClass: String?
    public var amount: Int?
}

public struct Facet {
    public var id: Int?
    public var attributeGroupId: String?
    public var attributeId: String?
    public var title: String?
    public var code: String?
    public var cssClass: String?
    public var orderNumber: String?
    public var showInSpecList: String?
    public var useInFilter: String?
    public var description: String?
    public var values: [FacetAttribute] = []
}

public struct FacetAttribute {
    public var attributes : String?
    public var id: Int?
    public var value: String?
    public var valueTitle: String?
    public var cssClass: String?
    public var attributeId: String?
    public var image: String?
    public var code: String?
    public var displayType: String?
    public var title: String?
    public var orderNumber: String?
    public var description: String?
    public var showInSpecList: String?
    public var useInFilter: String?
    public var attributeGroupId: String?
    public var attributesCssClass: String?
    public var amount: Int?
}

