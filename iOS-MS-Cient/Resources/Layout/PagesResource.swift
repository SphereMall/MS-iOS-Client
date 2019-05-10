//
//  PagesResource.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 5/9/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public class PagesResource<T: Decodable>: Resource<PagesSM> {
    
    public override func getURI() -> String {
        return "pages"
    }
    
    public func `default`(closure: @escaping (PagesSM?, ErrorSM?) -> Swift.Void) {
        
        let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/default"

        self.heandler.request(url: url, method: .get, parameters: getQueryParams()) { (pages: PagesSM?, error: ErrorSM?) in
            closure(pages?.rebuild(), error)
        }
    }
}
