//
//  PaymentProvidersSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class PaymentProvidersSM: Entity, Decodable {
    var data : [PaymentProvidersData]?
    var error : Error?
    var meta : Meta?
}

public struct PaymentProvidersData: Decodable {
    var attributes : PaymentProvidersAttribute?
    var id : String?
    var type : String?
}

public struct PaymentProvidersAttribute: Decodable  {
    var apiKey : String?
    var autoReturnUrl : AutoReturnUrl?
    var className : String?
    var id : String?
    var keyVersion : String?
    var merchantId : MerchantId?
    var msUrl : AutoReturnUrl?
    var order : String?
    var postUrl : PostUrl?
    var returnUrl : String?
    var secretKey : SecretKey?
    var shaIn : String?
    var shaOut : String?
    var title : String?
    var websiteId : String?
}

public struct PostUrl: Decodable  {
    
}

public struct SecretKey: Decodable  {
    
}

public struct MerchantId: Decodable  {
    
}

public struct AutoReturnUrl: Decodable  {
    var action : Action?
    var url : String?
}

public struct Action: Decodable  {
    var objectId : String?
    var type : String?
}
