//
//  ElasticSearchResource.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 10/2/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

extension String {
    func toJSON() -> Any? {
        guard let data = self.data(using: .utf8, allowLossyConversion: false) else { return nil }
        return try? JSONSerialization.jsonObject(with: data, options: .mutableContainers)
    }
}

public class ElasticSearchResource <T: Decodable> : Resource <ProductsSM> {
    
    override public func getURI() -> String {
        return "elasticsearch"
    }
    
    public func search(filter: ElasticSearchFilter, closure: @escaping (GridSM?, ErrorSM?) -> Void) {
        
        let url = String(self.client!.getGatewayUrl() + self.getURI() + "/" + filter.index() + "/_search")
        var params = filter.toJson() as? [String: Any] ?? nil
        params?["size"] = getLimit()
        params?["from"] = getOffset()
        
        Alamofire.request(url, method: .post, parameters: params, encoding: JSONEncoding.default)
            .responseJSON { response in
                
                if let value = response.value {
                    let json = JSON(value)
                    let data = try! json.rawData()
                    let decoder = JSONDecoder()
                    
                    guard let items = try? decoder.decode(ElasticEntity.self , from: data) else {
                        closure(nil, ErrorSM(code: 0, status: "Can't parse data for entity \(T.self)"))
                        return
                    }
                    
                    closure(self.gridFrom(elasticEntity: items), nil)
                }
        }
    }
    
    private func gridFrom(elasticEntity: ElasticEntity) -> GridSM? {
        
        if let items = elasticEntity.hits?.hits {
            
            let grid = GridSM()
            grid.data = []
            
            for item in items {
                if let sourse = item._source?.scope,
                    let sourseJson = sourse.toJSON() {
                    
                    let json = JSON(sourseJson)
                    let data = try! json.rawData()
                    let decoder = JSONDecoder()
                    
                    let item = GridItem()
                    if let object = try? decoder.decode(ProductsSM.self, from: data) {
                        item.item = object.rebuild()
                        item.type = "products"
                    } else if let object = try? decoder.decode(DocumentsSM.self, from: data) {
                        item.item = object.rebuild()
                        item.type = "documents"
                    }
                    
                    grid.data!.append(item)
                }
            }
            
            return grid
        }
        
        return nil
    }
    
    override public func getQueryParams() -> [String : String] {
        return [:]
    }
    
    @available(*, unavailable, message: "Method count() can not be used")
    public override func count(closure: @escaping SMResponseCount) {}
    
    @available(*, unavailable, message: "Method get() can not be used")
    public override func get(id: String, closure: @escaping SMResponse<ProductsSM>) {}
    
    @available(*, unavailable, message: "Method create() can not be used")
    public override func create(data: [String: String], closure: @escaping SMResponse<ProductsSM>) {}
    
    @available(*, unavailable, message: "Method update() can not be used")
    public override func update(id: String, data: [String: String], closure: @escaping SMResponse<ProductsSM>) {}
    
    @available(*, unavailable, message: "Method delete() can not be used")
    public override func delete(id: String, closure: @escaping SMResponseDelete) {}
    
}
