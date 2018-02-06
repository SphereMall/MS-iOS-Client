//
//  BasketResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/24/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class BasketResource <T: Decodable> : Resource <BasketSM> {
    override public func getURI() -> String {
        return "basket"
    }

    public override func get(id: String, closure: @escaping SMResponse<BasketSM>) {
        
        var params: [String: String]? = nil
        
        if self.fields.count > 0 {
            params = [:]
            params!["fields"] = fields.joined(separator: ",")
        }
    
        let uriAppend = client!.getGatewayUrl() + getURI() + "/\(id)"
        
        heandler.request(url: uriAppend, method: .get, parameters: params) { (item: BasketSM?, error: NSError?) in
            closure(item, error)
        }
    }
    
    public override func update(id: String, data: [String: String], closure: @escaping SMResponse<BasketSM>) {
        let uriAppend = client!.getGatewayUrl() + getURI()
        heandler.request(url: uriAppend, method: .put, parameters: data) { (item, error) in
            closure(item, error)
        }
    }
    
    public func new(data: [String: String]?, closure: @escaping SMResponse<BasketSM>) {
        
        let uriAppend = client!.getGatewayUrl() + getURI() + "/new"
        
        heandler.request(url: uriAppend, method: .post, parameters: data) { (item: BasketSM?, error: NSError?) in
            
        }
    }
    
    public func removeAllItems(params: [String: String], closure: @escaping SMResponse<BasketSM>) {
        let uriAppend = client!.getGatewayUrl() + getURI()
        heandler.request(url: uriAppend, method: .delete, parameters: params) { (item, error) in
            closure(item, error)
        }
    }
}
