//
//  DocumentsSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/15/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class DocumentsSM: Entity, Decodable {
    public var data: [DocumentData]?
    public var meta: Meta?
    public var status : String?
    public var ver : String?
}

public struct DocumentData: Decodable {
    public var documentAttributes: DocumentModel?
    public var id: String?
    public var type: String?
}

public struct DocumentModel: Decodable, Gridable {
    public var createDate: String?
    public var functionalNameId: String?
    public var id: String?
    public var lastUpdate: String?
    public var title: String?
    public var urlCode: String?
    public var visible: String?
}
