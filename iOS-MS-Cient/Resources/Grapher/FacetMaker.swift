//
//  FacetMaker.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 3/28/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class FacetMaker: NSObject {
    
    static public func `do`(_ facets : FacetsSM) -> [Facet] {
        
        var facetsPack: [Facet] = []
        
        for item in facets.data!.attributes! {
            var index: Int?
            var liveItem = facetsPack.first(where: { (facet) -> Bool in
                if facet.attributeId == item.attributeId {
                    index = facetsPack.index(where: { (facet) -> Bool in
                        if facet.attributeId == item.attributeId { return true } else { return false }
                    })
                    return true
                } else {
                    return false
                }
            })
            
            if liveItem != nil && index != nil {
                liveItem!.values.append(makeFacetValueFrom(item: item))
                facetsPack[index!] = liveItem!
            } else {
                facetsPack.append(makeFacetFrom(item: item))
            }
        }
        
        return facetsPack
    }
    
    static private func makeFacetValueFrom(item: FacetsAttribute) -> FacetAttribute {
        var value = FacetAttribute()
        value.title = item.title
        value.value = item.value
        value.orderNumber = item.orderNumber
        value.image = item.image
        value.cssClass = item.cssClass
        value.code = item.code
        value.amount = item.amount
        return value
    }
    
    static private func makeFacetFrom(item: FacetsAttribute) -> Facet {
        var facet = Facet()
        facet.title = item.title
        facet.orderNumber = item.orderNumber
        facet.cssClass = item.cssClass
        facet.code = item.code
        facet.id = item.id
        facet.attributeGroupId = item.attributeGroupId
        facet.attributeId = item.attributeId
        facet.description = item.description
        facet.showInSpecList = item.showInSpecList
        facet.useInFilter = item.useInFilter
        facet.values.append(makeFacetValueFrom(item: item))
        
        return facet
    }
}
