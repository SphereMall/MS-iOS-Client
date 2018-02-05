//
//  GridResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/23/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class GridResource<ProductsSM: Decodable> : Resource <ProductsSM> {
    
    override func getURI() -> String {
        return "grid"
    }
    
    internal override func getQueryParams() -> [String : String] {
        
        var params = super.getQueryParams()
    
        if params["where"] == nil {
            return params
        }
    
//        foreach (explode('&', $params['where']) as $where) {
//            list($key, $value) = explode('=', $where);
//            $params[$key] = $value;
//        }
//
//        unset($params['where']);
        return params
    }
    
    public func facets() {
        
//        let params = self.getQueryParams()
    
//        $response = $this->handler->handle('GET', false, 'filter', $params);
//        return $this->make($response, false, new FacetsMaker());
    }

    
    public override func count(closure: @escaping SMResponseCount) {
        
        let params = self.getQueryParams()
        
        let url = String(self.client!.getGatewayUrl() + self.getURI())
        self.heandler.request(url: url, method: .get, parameters: params) { (object: CounterSM?, error: NSError?) in
            closure(SMCountMaker.count(object: object), error)
        }
    }
    
    open override func get(id: String, closure: @escaping SMResponse<ProductsSM>) {
        fatalError("Method get() can not be use with correlations")
    }
    
    open override func create(data: [String: String], closure: @escaping SMResponse<ProductsSM>) {
        fatalError("Method create() can not be use with correlations")
    }
    
    open override func update(id: String, data: [String: String], closure: @escaping SMResponse<ProductsSM>) {
        fatalError("Method update() can not be use with correlations")
    }
    
    open override func delete(id: String, closure: @escaping SMResponseDelete) {
        fatalError("Method delete() can not be use with correlations")
    }
}
