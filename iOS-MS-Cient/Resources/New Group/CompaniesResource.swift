//
//  CompaniesResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/9/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class CompaniesResource<T: Decodable>: Resource<CompaniesSM>  {
    override func getURI() -> String {
        return "companies"
    }
}
