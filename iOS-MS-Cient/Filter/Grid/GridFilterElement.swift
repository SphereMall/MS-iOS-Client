//
//  GridFilterElement.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class GridFilterElement: NSObject {
    
    internal var name: String?
    internal var values: [String] = []
   
    public init(values: [String]) {
        self.values = values
    }
    
    public func getValues() -> [String] {
        return self.values
    }
    
    public func getName() -> String {
        return self.name ?? ""
    }
}
