//
//  AttributeCodeFilterCriteria.swift
//  iOS-MS-Cient
//
//  Created by Vlad Chernetsky on 12/5/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import Foundation

public class AttributeCodeFilterCriteria: ESFilterCriteria {
    
    private let attributeCode: String
    private let values:[Int32]
    
    public init(attributeCode:String, values:[Int32]) {
        self.attributeCode = attributeCode
        self.values = values
    }
    
    public func toJson() -> NSDictionary {
        return [attributeCode + "_attr.valueId": values]
    }
}
