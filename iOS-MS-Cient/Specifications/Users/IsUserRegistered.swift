//
//  IsUserRegistered.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/9/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class IsUserRegistered: NSObject, FilterSpecification {
    
    private var email: String?
    private var password: String?
    
    public init(email: String!, password: String!) {
        self.email = email
        self.password = password
    }
    
    public func asFilter() -> Predicate {
        return Predicate(field: "email", op: .equal, value: email!)
    }
    
    public func isSatisfiedBy(user: UserSM) -> Bool {
        return self.email == self.email && self.password == self.password
    }
}
