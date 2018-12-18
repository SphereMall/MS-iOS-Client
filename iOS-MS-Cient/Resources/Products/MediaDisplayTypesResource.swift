//
//  MediaDisplayTypesResource.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 12/18/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class MediaDisplayTypesResource<T: Decodable> : Resource <MediaDisplayTypeSM>  {
    override public func getURI() -> String {
        return "mediadisplaytypes"
    }
}
