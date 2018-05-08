//
//  GridFilterElement.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class GridFilterElement: NSObject {
    
    public var name: String = ""
    public var values: [String] = []
   
    public init(values: [String]) {
        self.values = values
    }
    
    public func getValues() -> [String] {
        return self.values
    }
    
    public func asString() -> String {
        
        var str = "["
        for filter in values {
            str += filter + ","
        }
        
        str = str.dropLast().description
        str = "\(str)]"
        // \"attributes\":[1,2,3]
        return "\"\(name)\":\(str)"
    }
    
    public func getName() -> String {
        return self.name
    }
}
