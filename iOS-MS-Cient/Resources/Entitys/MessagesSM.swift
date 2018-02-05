//
//  MessagesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class MessagesSM: Entity, Decodable {
    var data : [MessagesAttributes]?
    var error : Error?
    var success : Bool?
    var ver : Int?
    var meta: Meta?
}

struct MessagesAttributes: Decodable {
    var attributes : MessagesModel?
    var type : String?
    var id: String?
}

struct MessagesModel: Decodable  {
    var accepted : String?
    var acceptedDate : String?
    var address : String?
    var date : String?
    var email : String?
    var id : String?
    var message : String?
    var name : String?
    var number1 : String?
    var postcode : String?
    var recipientId : String?
    var senderId : String?
    var subject : String?
    var surname : String?
    var telephone : String?
    var text1 : String?
    var text2 : String?
    var text3 : String?
    var viewId : String?
}

