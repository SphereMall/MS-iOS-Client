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

public enum Entities: String {
    case products = "sm-products"
    case documents = "sm-documents"
    case pages = "sm-pages"
}

public class ElasticSearchResource <T: Decodable> : Resource <ProductsSM> {
    
    override public func getURI() -> String {
        return "elasticsearch"
    }
    
    public func search(filter: ElasticSearchFilter, closure: @escaping (GridSM?, ErrorSM?) -> Void) {
        
        let urlStr = String(self.client!.getGatewayUrl() + self.getURI() + "/" + filter.index() + "/_search")
        let url = URL(string: urlStr)!
        
        var params = filter.toJson() as! [String : Any]
        params["size"] = getLimit().description
        params["from"] = getOffset().description
        
        guard let json = try! params.json(), let jsonData = json.data(using: .utf8) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        Alamofire.request(request).responseJSON { (response) in
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
    
    public func facets(filter: ESCatalogFilter, groupBy: String? = nil, entities: [Entities]? = nil, closure: @escaping (ESFacet?, ErrorSM?) -> Void) {

        let url = String(self.client!.getGatewayUrl() + self.getURI() + "/filter")
        
        var parameters: [String: String] = [:]
        parameters["params"] = filter.params()
        parameters["config"] = filter.config()
        parameters["groupBy"] = groupBy
        parameters["entities"] = entities?.compactMap({ (entity) -> String? in return entity.rawValue }).joined(separator: ",")
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString))
            .responseJSON { response in
                
                if let value = response.value {
                    let json = JSON(value)
                    let data = try! json.rawData()
                    let decoder = JSONDecoder()
                    
                    guard let items = try? decoder.decode(ESFacet.self, from: data) else {
                        closure(nil, ErrorSM(code: 0, status: "Can't parse data for entity \(T.self)"))
                        return
                    }
                    
                    closure(items, nil)
                }
        }
    }
    
    public func fetch(closure: @escaping (GridSM?, ErrorSM?) -> Void) {
        
        var parameters: [String: String] = getQueryParams()
        let url = String(self.client!.getGatewayUrl() + self.getURI() + "/" + parameters["index"]! + "/_search")
        
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding(destination: .queryString))
            .responseJSON { response in
                
                if let value = response.value {
                    let json = JSON(value)
                    let data = try! json.rawData()
                    let decoder = JSONDecoder()
                    
                    guard let items = try? decoder.decode(GridSM.self, from: data) else {
                        closure(nil, ErrorSM(code: 0, status: "Can't parse data for entity \(T.self)"))
                        return
                    }
                    
                    closure(items, nil)
                }
        }
    }
    
    public func filters(filter: Filter) -> ElasticSearchResource {
        super.filter(filter: filter)
        return self
    }
    
    override public func getQueryParams() -> [String : String] {
        
        var params = super.getQueryParams()
        
        let whereParams = params["where"]
        var paramsJson: [String : Any] = [:]
        
        paramsJson["size"] = params["limit"]
        paramsJson["from"] = params["offset"]
        
        if let value = params["size"] {
            paramsJson["size"] = value
        }
        
        params.removeAll()
        
        params["index"] = paramsJson["index"] as! String
        paramsJson.removeValue(forKey: "index")
        params["body"] = paramsJson.jsonString!
        
        return params
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
