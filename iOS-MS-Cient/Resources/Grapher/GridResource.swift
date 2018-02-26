//
//  GridResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/23/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

struct StringCodableMap<Decoded : LosslessStringConvertible> : Codable {
    
    var decoded: Decoded
    
    init(_ decoded: Decoded) {
        self.decoded = decoded
    }
    
    init(from decoder: Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        let decodedString = try container.decode(String.self)
        
        guard let decoded = Decoded(decodedString) else {
            throw DecodingError.dataCorruptedError(
                in: container, debugDescription: """
                The string \(decodedString) is not representable as a \(Decoded.self)
                """
            )
        }
        
        self.decoded = decoded
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(decoded.description)
    }
}

public class GridResource<ProductsSM: Decodable> : Resource <GridSM> {
    
    override public func getURI() -> String {
        return "grid"
    }
    
    public override func getQueryParams() -> [String : String] {
        
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
    
    public override func all(closure: @escaping (GridSM?, NSError?) -> Void) {
        let url = String(self.client!.getGatewayUrl() + self.getURI())
        let parameters = self.getQueryParams()
        
        self.heandler.request(url: url, method: .get, parameters: parameters) { (items, error) in
            closure(items, error)
        }
    }
    
    @available(*, unavailable, message: "Method get() can not be use with correlations")
    public override func get(id: String, closure: @escaping SMResponse<GridSM>) {}
    
    @available(*, unavailable, message: "Method create() can not be use with correlations")
    public override func create(data: [String: String], closure: @escaping SMResponse<GridSM>) {}
    
    @available(*, unavailable, message: "Method update() can not be use with correlations")
    public override func update(id: String, data: [String: String], closure: @escaping SMResponse<GridSM>) {}
    
    @available(*, unavailable, message: "Method delete() can not be use with correlations")
    public override func delete(id: String, closure: @escaping SMResponseDelete) {}
}
