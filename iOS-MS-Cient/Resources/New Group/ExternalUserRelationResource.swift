//
//  ExternalUserRelationResource.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 11/3/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class ExternalUserRelationResource<T: Decodable>: Resource<ExternalUserSM> {
    
    override public func getURI() -> String {
        return "externaluserrelation"
    }
}
