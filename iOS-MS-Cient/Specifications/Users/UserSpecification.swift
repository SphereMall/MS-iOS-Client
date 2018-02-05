//
//  UserSpecification.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/9/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

protocol UserSpecification {
    func isSatisfiedBy(user: UserModel) -> Bool
}
