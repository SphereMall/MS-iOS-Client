//
//  DocumentsResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/15/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class DocumentsResource<DocumentsSM: Decodable>: Resource<DocumentsSM> {
    override public func getURI() -> String {
        return "documents"
    }
}
