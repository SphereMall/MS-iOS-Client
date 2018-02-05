//
//  MessagesResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/10/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class MessagesResource<T: Decodable>: Resource<MessagesSM>  {
    override func getURI() -> String {
        return "messages"
    }
}
