//
//  DocumentsResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/15/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class DocumentsResource<T: Decodable>: Resource<DocumentsSM>, FullResource {
    
    public typealias T = DocumentsSM
    
    override public func getURI() -> String {
        return "documents"
    }
    
    public func detail(id: String, closure: @escaping (DocumentsSM?, ErrorSM?) -> Void) {
        
        let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/detail/\(id)"
        let parameters = self.getQueryParams()
        
        self.heandler.request(url: url, method: .get, parameters: parameters) { (item: DocumentsSM?, error) in
            closure(item?.rebuild(), error)
        }
    }
}
