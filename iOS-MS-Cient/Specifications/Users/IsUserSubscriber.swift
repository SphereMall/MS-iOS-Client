//
//  IsUserSubscriber.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/9/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class IsUserSubscriber: NSObject, FilterSpecification, UserSpecification {
    
    public func asFilter() -> Predicate {
        return Predicate(field: "isSubscriber", op: .equal, value: "1")
    }

    public func isSatisfiedBy(user: UserModel) -> Bool {
        if (user.id != nil) && (user.isSubscriber ?? "0") == "1" {
            return true
        } else {
            return false
        }
    }
}
