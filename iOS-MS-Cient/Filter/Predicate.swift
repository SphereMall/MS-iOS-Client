//
//  Predicate.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 12/18/17.
//  Copyright © 2017 SphereMall. All rights reserved.
//

import UIKit

class Predicate: NSObject {
    
    var field: String?
    var value: String?
    var op: FilterOperators!
    
    init(field: String?, op: FilterOperators, value: String) {
        self.field = field
        self.op = op
        self.value = value
    }
    
    public func make() -> String {
        if self.field == "fullSearch" {
            // MARK: LIKE {"fullSearch":"Jake"}
            return "{\"\(self.op.rawValue)\":\"\(self.value!)\"}"
        } else {
            // MARK: LIKE {"author":{"l":"Jake"}}
            return "{\"\(self.field!)\":{\"\(self.op.rawValue)\":\"\(self.value!)\"}}"
        }
    }
}
