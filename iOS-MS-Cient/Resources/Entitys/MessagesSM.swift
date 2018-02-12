//
//  MessagesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class MessagesSM: Entity, Decodable {
    public var data : [MessagesAttributes]?
    public var error : Error?
    public var success : Bool?
    public var ver : Int?
    public var meta: Meta?
}

public struct MessagesAttributes: Decodable {
    public var attributes : MessagesModel?
    public var type : String?
    public var id: String?
}

public struct MessagesModel: Decodable  {
    public var accepted : String?
    public var acceptedDate : String?
    public var address : String?
    public var date : String?
    public var email : String?
    public var id : String?
    public var message : String?
    public var name : String?
    public var number1 : String?
    public var postcode : String?
    public var recipientId : String?
    public var senderId : String?
    public var subject : String?
    public var surname : String?
    public var telephone : String?
    public var text1 : String?
    public var text2 : String?
    public var text3 : String?
    public var viewId : String?
}

