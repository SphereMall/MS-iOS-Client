//
//  AddressSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class AddressSM: Entity, Decodable {
    var data : [AddressAttributes]?
    var error : Error?
    var success : Bool?
    var ver : Int?
    var meta: Meta?
}

public struct AddressAttributes: Decodable {
    var attributes : AddressModel?
    var type : String?
    var id: String?
}

public struct AddressModel: Decodable  {
    var id : String?
    var phoneNumber : String?
    var gender : String?
    var companySite : String?
    var notice : String?
    var countryName : String?
    var cityName : String?
    var surname : String?
    var houseNumber : String?
    var street : String?
    var clientNumber : String?
    var userId : String?
    var paymentType : String?
    var additionalHouseNumber :String?
    var companyName : String?
    var zipCode : String?
    var email : String?
    var name : String?
    var initials : String?
}
