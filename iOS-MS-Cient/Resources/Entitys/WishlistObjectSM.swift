//
//  WishlistObjectSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/11/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class WishlistSM: Entity, Decodable {
    public var data: [WishlistAttributes]?
    public var error : Error?
    public var success : Bool?
    public var ver : Int?
    public var meta: Meta?
}

public struct WishlistAttributes: Decodable {
    public var id: String?
    public var attributes: WishListItemSM?
    public var type: String?
}

public class WishListItemSM: Decodable {
    public var id: String?
    public var userId: String?
    public var createDate: String?
    public var updateDate: String?
    public var objectId: String?
    public var entityId: String?

}

public class WishListObjectSM: NSObject {
    public var id: String?
    public var userId: String?
    public var createDate: String?
    public var updateDate: String?
    public var objectId: String?
    public var entityId: String?
    public var object: AnyObject?
    
    init(item: WishListItemSM, object: AnyObject?) {
        self.id = item.id
        self.userId = item.userId
        self.createDate = item.createDate
        self.updateDate = item.updateDate
        self.objectId = item.objectId
        self.entityId = item.entityId
        self.object = object
    }
}

