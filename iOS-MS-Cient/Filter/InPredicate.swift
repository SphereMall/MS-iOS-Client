//
//  INJsonObject.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/5/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class InPredicate: NSObject {
    var field: String!
    var values: [String]!
    
    public init(field: String, values:[String]) {
        self.field = field
        self.values = values
    }
    
    // MARK: LIKE {"author":["Jake","Billy"]}
    
    public func make() -> String {
        return "{\"\(field!)\":[\"\(values.joined(separator: "\",\""))\"]}"
    }
}

public class INOperator: NSObject {
    
    public lazy var predicates = [InPredicate] ()
    
    public init(predicates: [InPredicate] = []) {
        super.init()
        for predicate in predicates {
            addPredicate(predicate: predicate)
        }
    }
    
    public func addPredicate(predicate: InPredicate) {
        predicates.append(predicate)
    }
    
    public func asString() -> String {
        var str = ""
        for predicate in predicates {
            str = str + predicate.make() + ","
        }
        
        return String(str).dropLast().description
    }
}
