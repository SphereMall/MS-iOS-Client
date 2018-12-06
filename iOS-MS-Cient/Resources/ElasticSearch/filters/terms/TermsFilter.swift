//
//  TermsFilter.swift
//  iOS-MS-Cient
//
//  Created by Vlad Chernetsky on 12/5/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import Foundation

public class TermsFilter: LeafQueryFilter{
    
    public var name: String = "terms"
    private let esFilterCriteria: ESFilterCriteria
    
    public init(esFilterCriteria: ESFilterCriteria) {
        self.esFilterCriteria = esFilterCriteria
    }
    
    public func toJson() -> NSDictionary {
        return [name: esFilterCriteria.toJson()]
    }
}
