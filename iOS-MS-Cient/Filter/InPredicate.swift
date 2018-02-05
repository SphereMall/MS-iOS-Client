//
//  INJsonObject.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/5/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class InPredicate: NSObject {
    var field: String!
    var values: [String]!
    
    init(field: String, values:[String]) {
        self.field = field
        self.values = values
    }
    
    // MARK: LIKE {"author":["Jake","Billy"]}
    
    func make() -> String {
        return "{\"\(field!)\":[\"\(values.joined(separator: "\",\""))\"]}"
    }
}

class INOperator: NSObject {
    
    lazy var predicates = [InPredicate] ()
    
    init(predicates: [InPredicate] = []) {
        super.init()
        for predicate in predicates {
            addPredicate(predicate: predicate)
        }
    }
    
    func addPredicate(predicate: InPredicate) {
        predicates.append(predicate)
    }
    
    func asString() -> String {
        var str = ""
        for predicate in predicates {
            str = str + predicate.make() + ","
        }
        
        return String(str).dropLast().description
    }
}
