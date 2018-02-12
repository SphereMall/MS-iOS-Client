//
//  AddressSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class AddressSM: Entity, Decodable {
    public var data : [AddressAttributes]?
    public var error : Error?
    public var success : Bool?
    public var ver : Int?
    public var meta: Meta?
}

public struct AddressAttributes: Decodable {
    public var attributes : AddressModel?
    public var type : String?
    public var id: String?
}

public struct AddressModel: Decodable  {
    public var id : String?
    public var phoneNumber : String?
    public var gender : String?
    public var companySite : String?
    public var notice : String?
    public var countryName : String?
    public var cityName : String?
    public var surname : String?
    public var houseNumber : String?
    public var street : String?
    public var clientNumber : String?
    public var userId : String?
    public var paymentType : String?
    public var additionalHouseNumber :String?
    public var companyName : String?
    public var zipCode : String?
    public var email : String?
    public var name : String?
    public var initials : String?
}
