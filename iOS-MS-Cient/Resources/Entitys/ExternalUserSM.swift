//
//  ExternalUserSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 11/3/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class ExternalUserSM: Entity, Decodable {
    
    public var data : [ExternalUserAttributes]?
    public var meta : Meta?
    public var status : String?
    public var ver : String?
    
    public init(attributes: [ExternalUserAttributes]?, status: String?, meta: Meta?, ver: String?) {
        self.data = attributes
        self.meta = meta
        self.status = status
        self.ver = ver
    }
}

public class ExternalUserAttributes: Decodable {
    
    public var attributes : ExternalUserModel?
    public var type : String?
    public var id: String?
    
    public init(attributes: ExternalUserModel?, type: String?, id: String?) {
        self.attributes = attributes
        self.type = type
        self.id = id
    }
}

public class ExternalUserModel: Decodable  {
    public var id : String?
    public var userId: String?
    public var relatedUserId: String?
    public var additionalInfo: String?
    public var relationType: String?
}
