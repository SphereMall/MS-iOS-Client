//
//  UserSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 11/27/17.
//  Copyright © 2017 SphereMall. All rights reserved.
//

import UIKit

class AdminSM: Entity, Decodable {
    var data : [UserData]?
    var error : Error?
    var success : Bool?
    var ver : Int?
    var meta: Meta?
}

struct UserData: Decodable {
    var expiries : Int?
    var isGuest : Bool?
    var model : UserModel?
    var token : String?
    var type : String?
}

class UserSM: Entity, Decodable {
    var data : [UserAttributes]?
    var error : Error?
    var success : Bool?
    var ver : Int?
    var meta: Meta?
    
    init(attributes: [UserAttributes]?, error: Error?, meta: Meta?) {
        self.data = attributes
        self.error = error
        self.meta = meta
    }
}

struct UserAttributes: Decodable {
    var attributes : UserModel?
    var type : String?
    var id: String?
    
    init(attributes: UserModel?, type: String?, id: String?) {
        self.attributes = attributes
        self.type = type
        self.id = id
    }
}

struct UserModel: Decodable  {
    var avatar : String?
    var email : String?
    var isSubscriber : String?
    var endTime : String?
    var guid : String?
    var id : String?
    var isAccess : String?
    var lastLogin : String?
    var lifetime : String?
    var name : String?
    var password : String?
    var registerDate : String?
    var rights : String?
    var token : String?
    var username : String?
    var active: String?
    var basketId: String?
    var birthDate: String?
    var defaultAddressId: String?
    var gender: String?
    var initials: String?
    var ip: String?
    var isInvited: String?
    var langId: String?
    var lastUpdate: String?
    var lastVisitDate: String?
    var loginName: String?
    var number1: String?
    var number2: String?
    var number3: String?
    var patronymic: String?
    var phoneNumber: String?
//    var registrationDate: String?
    var subscribeDate: String?
    var surname: String?
    var text1: String?
    var text2: String?
    var text3: String?
    var text4: String?
    var text5: String?
    var userType: String?
}

