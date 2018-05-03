//
//  GridResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/23/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class GridResource<T: Decodable> : Resource <GridSM> {
    
    override public func getURI() -> String {
        return "grid"
    }
    
    public override func getQueryParams() -> [String : String] {
        
        var params = super.getQueryParams()
        
        if params["where"] == nil || params["where"] == "" {
            return params
        }
        
//        let whereCondition = params["where"]
//        params.removeValue(forKey: "where")
//
//        let whereArray: [String] = whereCondition!.components(separatedBy: "&")
//
//        for item in whereArray {
//            let keyValue = item.components(separatedBy: "=")
//            params[keyValue[0]] = keyValue[1]
//        }
        
        return params
    }
    
    public func filters(filter: FilterSpecification) -> GridResource {
        let gridFilter = GridFilter()

        self.filter = gridFilter.setFilters(filters: [filter.asFilter()])
        
        return self
    }
    
    public func facets(closure: @escaping ([Facet]?, ErrorSM?) -> Swift.Void) {
        
        let params = getQueryParams()
        
        let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/filter"
        
        heandler.request(url: url, method: .get, parameters: params) { (facets: FacetsSM?, error: ErrorSM?) in
            guard let unwrapperdFacets = facets else {
                closure(nil, error)
                return
            }
            closure(FacetMaker.do(unwrapperdFacets), error)
        }
    }

    
    public override func count(closure: @escaping SMResponseCount) {
        
        let params = self.getQueryParams()
        
        let url = String(self.client!.getGatewayUrl() + self.getURI())
        self.heandler.request(url: url, method: .get, parameters: params) { (object: CounterSM?, error: ErrorSM?) in
            closure(SMCountMaker.count(object: object), error)
        }
    }
    
    public override func all(closure: @escaping (GridSM?, ErrorSM?) -> Void) {
        let url = String(self.client!.getGatewayUrl() + self.getURI())
        let parameters = self.getQueryParams()
        
        self.heandler.request(url: url, method: .get, parameters: parameters) { (items: GridSM?, error) in
            closure(items?.rebuild(), error)
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
