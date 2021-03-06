//
//  Predicate.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 12/18/17.
//  Copyright © 2017 SphereMall. All rights reserved.
//

import UIKit

public class Predicate {
    
    public var field: String?
    public var value: String?
    public var op: FilterOperators!
    
    public init(field: String?, op: FilterOperators, value: String) {
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
