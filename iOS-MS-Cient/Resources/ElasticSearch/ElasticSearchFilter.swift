//
//  ElasticSearchFilter.swift
//  iOS-MS-Cient
//
//  Created by Vlad Chernetsky on 12/5/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import Foundation

public protocol ElasticSearchFilter {
    func index(indexes:String...)
    
    func query(queryFilter: ElasticSearchQuery)
    
    func toString() -> String
    
    func toJson() -> NSDictionary
    
    func index() -> String
}
