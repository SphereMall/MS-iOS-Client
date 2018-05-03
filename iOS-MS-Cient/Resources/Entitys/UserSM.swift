//
//  UserSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 11/27/17.
//  Copyright © 2017 SphereMall. All rights reserved.
//

import UIKit

public class AdminSM: Entity, Decodable {
    public var data : [UserData]?
    public var error : Error?
    public var success : Bool?
    public var ver : String?
    public var meta: Meta?
}

public struct UserData: Decodable {
    public var expiries : Int?
    public var isGuest : Bool?
    public var model : UserModel?
    public var token : String?
    public var type : String?
}

public class SlimUserSM: Entity, Decodable {
    public var data : SlimUserAttributes?
    public var error : Error?
    public var success : Bool?
    public var ver : String?
    public var meta: Meta?
    
    init(attributes: SlimUserAttributes?, error: Error?, meta: Meta?) {
        self.data = attributes
        self.error = error
        self.meta = meta
    }
}

public class SlimUserAttributes: Decodable {
    public var type : String?
    public var userId: String?
}

public class UserSM: Entity, Decodable {
    public var data : [UserAttributes]?
    public var meta : Meta?
    public var status : String?
    public var ver : String?
    
    init(attributes: [UserAttributes]?, status: String?, meta: Meta?, ver: String?) {
        self.data = attributes
        self.meta = meta
        self.status = status
        self.ver = ver
    }
}

public struct UserAttributes: Decodable {
    public var attributes : UserModel?
    public var type : String?
    public var id: String?
    
    init(attributes: UserModel?, type: String?, id: String?) {
        self.attributes = attributes
        self.type = type
        self.id = id
    }
}

public struct UserModel: Decodable  {
    public var avatar : String?
    public var email : String?
    public var isSubscriber : String?
    public var endTime : String?
    public var guid : String?
    public var id : String?
    public var isAccess : String?
    public var lastLogin : String?
    public var lifetime : String?
    public var name : String?
    public var password : String?
    public var registerDate : String?
    public var rights : String?
    public var token : String?
    public var username : String?
    public var active: String?
    public var basketId: String?
    public var birthDate: String?
    public var defaultAddressId: String?
    public var gender: String?
    public var initials: String?
    public var ip: String?
    public var isInvited: String?
    public var langId: String?
    public var lastUpdate: String?
    public var lastVisitDate: String?
    public var loginName: String?
    public var number1: String?
    public var number2: String?
    public var number3: String?
    public var patronymic: String?
    public var phoneNumber: String?
    public var subscribeDate: String?
    public var surname: String?
    public var text1: String?
    public var text2: String?
    public var text3: String?
    public var text4: String?
    public var text5: String?
    public var userType: String?
}
