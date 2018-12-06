//
//  AttributeFilterCriteria.swift
//  iOS-MS-Cient
//
//  Created by Vlad Chernetsky on 12/5/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import Foundation

public class AttributeIDFilterCriteria: ESFilterCriteria{
    
    private let attributeId: Int32
    private let values:[Int32]
    
    public init(attributeId:Int32, values:[Int32]) {
        self.attributeId = attributeId
        self.values = values
    }
    
    public func toJson() -> NSDictionary {
        return [String(attributeId) + "_attr.valueId": values]
    }
}
