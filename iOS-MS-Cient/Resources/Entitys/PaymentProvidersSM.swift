//
//  PaymentProvidersSM.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class PaymentProvidersSM: Entity, Decodable {
    
    var data : [PaymentProvidersData]?
    var error : Error?
    var meta : Meta?

    struct PaymentProvidersData: Decodable {
        var attributes : PaymentProvidersAttribute?
        var id : String?
        var type : String?

        struct PaymentProvidersAttribute: Decodable  {
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
            
            struct PostUrl: Decodable  {
                
            }
            
            struct SecretKey: Decodable  {
                
            }
            
            struct MerchantId: Decodable  {
                
            }
            
            struct AutoReturnUrl: Decodable  {
                var action : Action?
                var url : String?
                struct Action: Decodable  {
                    var objectId : String?
                    var type : String?
                }
            }
        }
    }
}
