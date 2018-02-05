//
//  ClassReflectionHelper.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/23/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class ClassReflectionHelper: NSObject {
    private var className: String!

    init(className: String) {
        self.className = className
    }
    
    public func getShortName() -> String {
        return self.className
    }
    
    public func getShortLowerCaseName() -> String {
        return self.className.lowercased()
    }
}
