//
//  DocumentsResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/15/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class DocumentsResource<DocumentsSM: Decodable>: Resource<DocumentsSM> {
    override func getURI() -> String {
        return "documents"
    }
}
