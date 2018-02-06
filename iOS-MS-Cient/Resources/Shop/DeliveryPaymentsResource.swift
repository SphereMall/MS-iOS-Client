//
//  DeliveryPaymentsResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/23/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class DeliveryPaymentsResource<DeliveryPaymentSM: Decodable> : Resource <DeliveryPaymentSM> {
    override public func getURI() -> String {
        return "deliverypaymentrelations"
    }
}
