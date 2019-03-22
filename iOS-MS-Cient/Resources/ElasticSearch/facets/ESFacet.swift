//
//  ESFacet.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 2/1/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public class Fasets {
    public var range: [RangeData] = []
    public var brands: [BrandsData] = []
    public var attributeValues: [AttributeValuesData] = []
    public var included: [IncludItem] = []
}

public class ESFacet: Decodable {
    
    public let data: [ESFacetData]?
    public var included: [IncludItem]?
    public let service: String?
    public let status: String?
    public let version: String?
    
    
    public func magic() -> Fasets {
        
        let facets = Fasets()
        
        if let inc = included {
            facets.included = inc
        }
        
        data?.forEach({ (facet) in
            switch facet.type {
            case "range":
                if let range = facet.item as? RangeData {
                    facets.range.append(range)
                }
            case "brands":
                if let range = facet.item as? BrandsData {
                    facets.brands.append(range)
                }
            case "attributeValues":
                if let range = facet.item as? AttributeValuesData {
                    facets.attributeValues.append(range)
                }
            default:
                break
            }
        })
        
        return facets
    }
}

public class ESFacetData: Decodable {

        public var type: String!
        public var item: AnyObject?
        
        public enum CodingKeys: String, CodingKey {
            case notRecognized, document, product, brand, attributeValues
        }
        
        public enum CodingKeyAttribute: String, CodingKey {
            case id
            case attributes
            case type
            case relationships
        }
        
        public convenience required init(from decoder: Decoder) throws {
            self.init()
            
            let container = try decoder.container(keyedBy: CodingKeyAttribute.self)
            
            let containerType = try container.decodeIfPresent(String.self, forKey: .type)
            guard let type = containerType else {
                self.type = "notRecognized"
                return
            }
            
            self.type = type

            switch type {
            case "range":
                if let attributes = try container.decodeIfPresent(RangeAttributes.self, forKey: .attributes) {
                    
                    let id = try? container.decodeIfPresent(Int.self, forKey: .id)
                    let range = RangeData(attributes: attributes, relationships: nil, id: id??.description, type: type)
                    
                    if let relationships = try? container.decodeIfPresent(ObjectRelationships.self, forKey: .relationships) {
                        range.relationships = relationships
                    }
                    
                    self.item = range as AnyObject
                }
            case "brands":
                if let attributes = try container.decodeIfPresent(AttributeBrand.self, forKey: .attributes) {
                    var brand = BrandsData(attributes: attributes, relationships: nil, id: attributes.id, type: type)
                    
                    if let relationships = try? container.decodeIfPresent(ObjectRelationships.self, forKey: .relationships) {
                        brand.relationships = relationships
                    }
                    
                    self.item = brand as AnyObject
                }
            case "attributeValues":
                if let attributes = try? container.decodeIfPresent(AttributeValues.self, forKey: .attributes) {
                    var attributeValues = AttributeValuesData(attributes: attributes, relationships: nil, id: attributes?.id, type: type)
                    if let relationships = try? container.decodeIfPresent(ObjectRelationships.self, forKey: .relationships) {
                        attributeValues.relationships = relationships
                    }
                    
                    self.item = attributeValues as AnyObject
                }
            default:
                self.type = "notRecognized"
            }
        }
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
