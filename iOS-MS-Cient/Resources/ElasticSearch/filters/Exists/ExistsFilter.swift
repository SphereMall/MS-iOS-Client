//
//  ExistsFilter.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 4/8/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public class ExistsFilter: LeafQueryFilter {
    
    public var name: String = "exists"
    private let esFilterCriteria: ESFilterCriteria
    
    public init(esFilterCriteria: ESFilterCriteria) {
        self.esFilterCriteria = esFilterCriteria
    }
    
    public func toJson() -> NSDictionary {
        return [name: esFilterCriteria.toJson()]
    }
}
