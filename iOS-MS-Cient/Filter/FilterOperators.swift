//
//  FilterOperators.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 12/18/17.
//  Copyright © 2017 SphereMall. All rights reserved.
//

enum FilterOperators: String {
    case like = "l"
    case like_left = "ll"
    case like_right = "lr"
    case equal = "e"
    case not_equal = "ne"
    case greater_than = "gt"
    case less_than = "lt"
    case greater_than_or_equal = "gte"
    case less_than_or_equal = "lte"
    case is_null = "is"
    case full_search = "fullSearch"
}
