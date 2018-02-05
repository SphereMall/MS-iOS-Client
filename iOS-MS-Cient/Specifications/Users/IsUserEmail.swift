//
//  IsUserEmail.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/9/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class IsUserEmail: NSObject, FilterSpecification {

    private var email: String!
    
    init(email: String) {
        self.email = email
    }
    
    public func asFilter() -> Predicate {
        return Predicate(field: "email", op: .equal, value: email)
    }
    
    public func isSatisfiedBy(user: UserSM) -> Bool {
        return self.email == self.email
    }
}
