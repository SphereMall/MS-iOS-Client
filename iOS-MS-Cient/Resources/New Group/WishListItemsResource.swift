//
//  WishListItemsResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/10/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class WishListItemsResource<T: Decodable>: Resource<WishlistSM>  {
    override func getURI() -> String {
        return "wishlistitems"
    }
}
