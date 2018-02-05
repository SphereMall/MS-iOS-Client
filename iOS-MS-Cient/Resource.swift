//
//  Resource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 11/29/17.
//  Copyright © 2017 SphereMall. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

protocol ResourceInterface {
    func getURI() -> String
    func getQueryParams() -> [String : String]
    var heandler: SMRequest! { get }
    var client: SMClient? { get }
}

typealias SMResponse<T> = (T?, NSError?) -> Swift.Void
typealias SMResponseCount = (Int?, NSError?) -> Swift.Void
typealias SMResponseDelete = (Bool?, NSError?) -> Swift.Void

class Resource<T: Decodable> : NSObject, ResourceInterface {
    
    var client: SMClient?
    private var version = ""
    private var limit = 10
    private var offset = 0
    private lazy var meta = false
    private lazy var ids: [String] = []
    private lazy var sort: [String] = []
    lazy var fields: [String] = []
    private lazy var `in` = INOperator()
    private lazy var filter = Filter()
    var heandler: SMRequest!
    
    init(client: SMClient, version: String = "v1") {
        self.client = client
        self.version = version
        self.heandler = SMRequest(client: client)
    }
    
    @discardableResult public func limit(limit: Int = 10, offset: Int = 0) -> Resource {
        self.limit = limit
        self.offset = offset
        return self
    }
    
    @discardableResult public func limit(limit: Int = 10) -> Resource {
        self.limit = limit
        return self
    }
    
    @discardableResult public func offset(offset: Int = 0) -> Resource {
        self.offset = offset
        return self
    }
    
    public func getLimit() -> Int {
        return self.limit
    }

    public func getOffset() -> Int {
        return self.offset
    }
    
    @discardableResult public func ids(ids: [String]) -> Resource {
        self.ids = ids
        return self
    }
    
    public func getIds() -> [String] {
        return self.ids
    }
    
    @discardableResult public func filter(predicate:Predicate) -> Resource {
        self.filter.setFilters(filters: [predicate])
        return self
    }
    
    @discardableResult public func filters(predicates:[Predicate]) -> Resource {
        for predicate in predicates {
            self.filter.setFilters(filters: [predicate])
        }

        return self
    }
    
    @discardableResult public func `in`(predicate: InPredicate) -> Resource {
        self.in.addPredicate(predicate: predicate)
        return self
    }
    
    @discardableResult public func ins(predicates: [InPredicate]) -> Resource {
        for predicate in predicates {
            self.in.addPredicate(predicate: predicate)
        }
        return self
    }
    
    @discardableResult public func sort(field: String) -> Resource {
        self.sort.append(field)
        return self
    }
    
    public func getSort() -> [String] {
        return self.sort
    }
    
    @discardableResult public func withMeta() -> Resource {
        self.meta = true
        return self
    }
    
    @discardableResult public func fields(fields: [String]) -> Resource  {
        for field in fields {
            self.fields.append(field)
        }
    
        return self
    }

    public func getFields() -> [String] {
        return self.fields
    }
    
    public func getVersion() -> String {
        return self.version
    }
    
    func getURI() -> String {
        return String()
    }
    
    func getQueryParams() -> [String : String] {
        
        var params : [String : String] = [
            "offset" : String(self.offset),
            "limit"  : String(self.limit),
        ]
        
        if self.ids.count > 0 {
            params["ids"] = self.ids.joined(separator: ",")
        }
        
        if self.fields.count > 0 {
            params["fields"] = self.fields.joined(separator: ",")
        }
        
        if self.filter.getFilters().count > 0 {
            params["where"] = self.filter.asString()
        }

        if self.in.predicates.count > 0 {
            params["in"] = self.in.asString()
        }

        if self.sort.count > 0 {
            params["sort"] = self.sort.joined(separator: ",")
        }
        
        return params
    }
    
    // MARK: CRUD
    func get(id: String, closure: @escaping SMResponse<T>) {
        
        let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/by"
        let parameters = self.getQueryParams()
        
        self.heandler.request(url: url, method: .get, parameters: parameters) { (item, error) in
            closure(item, error)
        }
    }
    
    open func all(closure: @escaping SMResponse<T>) {
        
        let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/by"
        let parameters = self.getQueryParams()
        
        self.heandler.request(url: url, method: .get, parameters: parameters) { (items, error) in
            closure(items, error)
        }
    }
    
    open func first(closure: @escaping SMResponse<T>) {
        
        let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/by"
        var parameters: [String : String] = self.getQueryParams()
        _ = parameters.updateValue("1", forKey: "limit")

        self.heandler.request(url: url, method: .get, parameters: parameters) { (item, error) in
            closure(item, error)
        }
    }
    
    open func count(closure: @escaping SMResponseCount) {
        
        let url = String(self.client!.getGatewayUrl() + self.getURI())
        self.heandler.request(url: url, method: .get, parameters: nil) { (object: CounterSM?, error: NSError?) in
            closure(SMCountMaker.count(object: object), error)
        }
    }
    
    open func create(data: [String: String], closure: @escaping SMResponse<T>) {
        
        let url = String(self.client!.getGatewayUrl() + self.getURI())
        
        self.heandler.request(url: url, method: .post, parameters: data) { (item, error) in
            closure(item, error)
        }
    }
    
    open func update(id: String, data: [String: String], closure: @escaping SMResponse<T>) {
        
        let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/" + id
        
        self.heandler.request(url: url, method: .put, parameters: data) { (item, error) in
            closure(item, error)
        }
    }
    
    open func delete(id: String, closure: @escaping SMResponseDelete) {

        let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/" + id
        self.heandler.request(url: url, method: .delete, parameters: nil) { (item: SMDeletedObject?, error: NSError?) in
            closure(item?.data?.first, error)
        }
    }
}