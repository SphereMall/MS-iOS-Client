//
//  UserEventSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 5/28/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public class UserEventSM: Entity, Decodable {
    public let data: [UserEventData]?
    public var status : String?
    public var version : String?
}

public struct UserEventData: Decodable {
    public var id: String?
    public var type: String?
    public var attributes: UserEventAttributes?
    
    public init(_ include: IncludItem) {
        guard let object = include.item as? UserEventAttributes else { return }
        self.attributes = object
        self.type = include.type
        self.id = include.id
    }
    
    public enum CodingKeys: String, CodingKey {
        case id = "id"
        case attributes = "attributes"
        case relationships = "relationships"
        case type = "type"
    }
    
    public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)

        id = try values.decodeIfPresent(String.self, forKey: .id)
        attributes = try values.decodeIfPresent(UserEventAttributes.self, forKey: .attributes)
        type = try values.decodeIfPresent(String.self, forKey: .type)
    }
}

public struct UserEventAttributes: Decodable {
    public var id: String?
    public var userId: String?
    public var eventId: String?
    public var createDate: String?
    public var eventData: String?
}
