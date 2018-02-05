//
//  CompaniesSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class CompaniesSM: Entity, Decodable {
    var data : [CompaniesAttributes]?
    var error : Error?
    var success : Bool?
    var ver : Int?
    var meta: Meta?
}

struct CompaniesAttributes: Decodable {
    var attributes : CompaniesModel?
    var type : String?
    var id: String?
}

struct CompaniesModel: Decodable  {
    var city : String?
    var companyName : String?
    var country : String?
    var houseNumber : String?
    var id : String?
    var kvkNumber : String?
    var street : String?
    var zipCode : String?
}
