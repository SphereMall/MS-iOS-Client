//
//  DeliveryProvidersResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/23/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class DeliveryProvidersResource<DeliveryProviderSM: Decodable> : Resource <DeliveryProviderSM>{

    override func getURI() -> String {
        return "deliveryproviders"
    }
}
