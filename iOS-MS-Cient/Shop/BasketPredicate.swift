//
//  BasketPredicate.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/25/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit
import SwiftyJSON

public class BasketPredicateAttribute: Encodable {
    public var attributeId: String!
    public var attributeValueId: String!
    public var userValue: String?
    
    public init(attributeId: String, attributeValueId: String, userValue: String? = nil) {
        self.attributeId = attributeId
        self.attributeValueId = attributeValueId
        self.userValue = userValue
    }
}

public class BasketPredicateObject: Encodable {
    public var id: String!
    public var amount: Int!
    public var compound: String?
    public var itemId: String?
    public var attributes: [BasketPredicateAttribute]?
}

public class BasketUpdatePredicate: BasketPredicate {
    
    public var itemId: String

    public init(itemId: String, id: String, amount: Int) {
        self.itemId = itemId
        super.init(id: id, amount: amount)
    }
    
    public override func make() -> String {
        
        let codableObject = BasketPredicateObject()
        codableObject.amount = amount
        codableObject.id = id
        codableObject.itemId = itemId
        
        guard let data = try? JSONEncoder().encode(codableObject) else { return "" }
        guard let string = JSON(data).rawString() else { return "" }
        
        return string
    }
}

public class BaskeDeletePredicate: BasketPredicate {
    
    public var itemId: String
    
    public init(itemId: String, id: String) {
        self.itemId = itemId
        super.init(id: id)
    }
    
    public override func make() -> String {
        
        let codableObject = BasketPredicateObject()
        codableObject.id = id
        codableObject.itemId = itemId
        
        guard let data = try? JSONEncoder().encode(codableObject) else { return "" }
        guard let string = JSON(data).rawString() else { return "" }
        
        return string
    }
}

public class BasketPredicate: NSObject {
    
    public final var id: String!
    public final var amount: Int!
    public final var compound: String?
    public final var attributes: [BasketPredicateAttribute]?
    
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
    
    public init(id: String, amount: Int, attributes: [BasketPredicateAttribute]) {
        self.id = id
        self.amount = amount
        self.attributes = attributes
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
        
        let codableObject = BasketPredicateObject()
        codableObject.amount = amount
        codableObject.id = id
        codableObject.compound = compound
        codableObject.attributes = attributes
        
        guard let data = try? JSONEncoder().encode(codableObject) else { return "" }
        guard let string = JSON(data).rawString() else { return "" }
        
        return string
    }
}

