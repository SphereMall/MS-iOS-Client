//
//  InteractsWithProperties.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public protocol InteractsWithProperties {
    var properties: [String]  { set get }
}

public extension InteractsWithProperties {
    
    public func getProperty(name: String) {
//
//        if (isset($this->properties[$name])) {
//            return $this->properties[$name];
//        }
//
//        return null
    }
}

extension Dictionary where Value: RangeReplaceableCollection {
//    func merged(another: [String: String]) -> [String: String] {
//        var result: [String: String] = [:]
//        for (key, value) in self {
//            result[key] = value
//        }
//        for (key, value) in another {
//            if let collection = result[key] {
//                result[key] = collection + value
//            } else {
//                result[key] = value
//            }
//        }
//        return result
//    }
}
