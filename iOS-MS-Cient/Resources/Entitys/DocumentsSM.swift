//
//  DocumentsSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/15/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class DocumentsSM: Entity, Decodable {
    var data: [DocumentData]?
    var error: Error?
    var meta: Meta?
}

public struct DocumentData: Decodable {
    var documentAttributes: DocumentModel?
    var id: String?
    var type: String?
}

public struct DocumentModel: Decodable  {
    var createDate: String?
    var functionalNameId: String?
    var id: String?
    var lastUpdate: String?
    var title: String?
    var urlCode: String?
    var visible: String?
}
