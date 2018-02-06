//
//  FilterSpecification.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/9/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public protocol FilterSpecification {
    func asFilter() -> Predicate
}
