//
//  ElasticSearchQuery.swift
//  iOS-MS-Cient
//
//  Created by Vlad Chernetsky on 12/5/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import Foundation

public protocol ElasticSearchQuery {
    var name: String { get set }
    
    func toJson() -> NSDictionary
}
