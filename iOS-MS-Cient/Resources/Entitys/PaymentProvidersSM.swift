//
//  PaymentProvidersSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class PaymentProvidersSM: Entity, Decodable {
    public var data : [PaymentProvidersData]?
    public var meta: Meta?
    public var status : String?
    public var ver : String?
}

public struct PaymentProvidersData: Decodable {
    public var attributes : PaymentProvidersAttribute?
    public var id : String?
    public var type : String?
}

public struct PaymentProvidersAttribute: Decodable  {
    public var apiKey : String?
    public var autoReturnUrl : String?
    public var className : String?
    public var id : String?
    public var keyVersion : String?
    public var merchantId : MerchantId?
    public var msUrl : String?
    public var order : String?
    public var postUrl : PostUrl?
    public var returnUrl : String?
    public var secretKey : SecretKey?
    public var shaIn : String?
    public var shaOut : String?
    public var title : String?
    public var websiteId : String?
}

public struct PostUrl: Decodable  {
    
}

public struct SecretKey: Decodable  {
    
}

public struct MerchantId: Decodable  {
    
}

public struct Action: Decodable  {
    public var objectId : String?
    public var type : String?
}
