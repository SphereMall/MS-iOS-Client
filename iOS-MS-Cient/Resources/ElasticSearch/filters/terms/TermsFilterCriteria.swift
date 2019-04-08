//
//  TermsFilterCriteria.swift
//  iOS-MS-Cient
//
//  Created by Vlad Chernetsky on 12/5/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import Foundation

public class TermsFilterCriteria: ESFilterCriteria {
    
    private let field:String
    private let values:[String]
    
    public init(field:String,values:[String]) {
        self.field = field
        self.values = values
    }
    
   public func toJson() -> NSDictionary {
        return [field: values]
    }
}

public class TermFilterCriteria: ESFilterCriteria {
    
    private let field:String
    private let value:String
    
    public init(field: String, value:String) {
        self.field = field
        self.value = value
    }
    
    public func toJson() -> NSDictionary {
        return [field: value]
    }
}
