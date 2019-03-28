//
//  FullResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public protocol FullResource : ResourceInterface {
    associatedtype T: Decodable, EntityRebuilder
    func fullAll(closure: @escaping (T?, ErrorSM?) -> Swift.Void)
    func fullBy(code: String, closure: @escaping (T?, ErrorSM?) -> Swift.Void)
    func fullBy(id: Int, closure: @escaping (T?, ErrorSM?) -> Swift.Void)
}

public extension FullResource {
    
    func fullAll(closure: @escaping (T?, ErrorSM?) -> Swift.Void) {
        full { (item, error) in
            closure(item?.rebuild(), error)
        }
    }
    
    private func full(id: Int? = nil, closure: @escaping (T?, ErrorSM?) -> Swift.Void) {
        
        var uriAppend = client!.getGatewayUrl() + getURI() + "/full"
        let params = self.getQueryParams()
    
        if id != nil {
            uriAppend = uriAppend + "/\(id!)"
        }
        
        heandler.request(url: uriAppend, method: .get, parameters: params) { (item, error) in
            closure(item, error)
        }
    }
    
    private func full(url: String, closure: @escaping (T?, ErrorSM?) -> Swift.Void) {
        
        let url = client!.getGatewayUrl() + getURI() + "/url/\(url)"
        let params = self.getQueryParams()
        
        heandler.request(url: url, method: .get, parameters: params) { (item, error) in
            closure(item, error)
        }
    }
    
    func fullBy(id: Int, closure: @escaping (T?, ErrorSM?) -> Swift.Void) {
        self.full(id: id) { (items, error) in
            closure(items?.rebuild(), error)
        }
    }
    
    func fullBy(code: String, closure: @escaping (T?, ErrorSM?) -> Swift.Void) {
        self.full(url: code) { (item, error) in
            closure(item?.rebuild(), error)
        }
    }
}
