//
//  BasketPredicate.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/25/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class BasketPredicate: NSObject {
    
    public final var id: String!
    public final var amount: Int!
    public final var compound: String?
    
    public init(id: String) {
        self.id = id
        self.amount = 0
        self.compound = nil
    }
    
    public init(id: String, amount: Int) {
        self.id = id
        self.amount = amount
        self.compound = nil
    }
    
    public init(id: String, amount: Int, compound: String) {
        self.id = id
        self.amount = amount
        self.compound = compound
    }
    
    public init(id: String, compound: String) {
        self.id = id
        self.amount = 0
        self.compound = compound
    }
    
    // MARK: LIKE [{"id":"1","amount":"1","compound":"promotion_hash"}]
    public func make() -> String {
        var str = "{"
        str += "\"id\":\"\(self.id.description)\",\"amount\":\"\(self.amount.description)\""
        
        if self.compound != nil {
            return str + ",\"compound\":\"\(self.compound!.description)\"}"
        }
        
        return str + "}"
    }
}

