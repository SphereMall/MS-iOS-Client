//
//  FullResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/22/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

protocol FullResource : ResourceInterface {
    associatedtype T: Decodable
    func fullAll(closure: @escaping (T?, NSError?) -> Swift.Void)
    func fullBy(code: String, closure: @escaping (T?, NSError?) -> Swift.Void)
    func fullBy(id: Int, closure: @escaping (T?, NSError?) -> Swift.Void)
}

extension FullResource {
    
    public func fullAll(closure: @escaping (T?, NSError?) -> Swift.Void) {
        full { (item, error) in
            closure(item, error)
        }
    }
    
    private func full(id: Int? = nil, closure: @escaping (T?, NSError?) -> Swift.Void) {
        
        var uriAppend = client!.getGatewayUrl() + getURI() + "/full"
        let params = self.getQueryParams()
    
        if id != nil {
            uriAppend = uriAppend + "/\(id!)"
        }
        
        heandler.request(url: uriAppend, method: .get, parameters: params) { (item, error) in
            closure(item, error)
        }
    }
    
    private func full(url: String, closure: @escaping (T?, NSError?) -> Swift.Void) {
        
        let url = client!.getGatewayUrl() + getURI() + "/url/\(url)"
        let params = self.getQueryParams()
        
        heandler.request(url: url, method: .get, parameters: params) { (item, error) in
            closure(item, error)
        }
    }
    
    public func fullBy(id: Int, closure: @escaping (T?, NSError?) -> Swift.Void) {
        self.full(id: id) { (items, error) in
            closure(items, error)
        }
    }
    
    public func fullBy(code: String, closure: @escaping (T?, NSError?) -> Swift.Void) {
        self.full(url: code) { (item, error) in
            closure(item, error)
        }
    }
}
