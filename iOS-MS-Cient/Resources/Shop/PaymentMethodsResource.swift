//
//  PaymentMethodsResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/16/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class PaymentMethodsResource<PaymentMethodsSM: Decodable> : Resource <PaymentMethodsSM> {
    override func getURI() -> String {
        return "paymentmethods"
    }
}
