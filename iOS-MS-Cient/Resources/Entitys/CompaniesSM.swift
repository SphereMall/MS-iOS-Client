//
//  CompaniesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class CompaniesSM: Entity, Decodable {
    public var data : [CompaniesAttributes]?
    public var meta : Meta?
    public var status : String?
    public var ver : String?
}

public struct CompaniesAttributes: Decodable {
    public var attributes : CompaniesModel?
    public var type : String?
    public var id: String?
}

public struct CompaniesModel: Decodable  {
    public var city : String?
    public var companyName : String?
    public var country : String?
    public var houseNumber : String?
    public var id : String?
    public var kvkNumber : String?
    public var street : String?
    public var zipCode : String?
}
