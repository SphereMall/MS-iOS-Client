//
//  AuthorizationSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 6/7/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public class AuthorizationSM: Entity, Decodable {
    public let data: [AuthorizationData]?
    public var status : String?
    public var version : String?
}

public struct AuthorizationData: Decodable {
    public var refreshToken: String?
    public var accessToken: String?
    public var expires_in: Int?
}
