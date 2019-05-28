//
//  UserEvents.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 5/27/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

public class UserEvents<T: Decodable>: Resource<UserEventSM>  {
    public override func getURI() -> String {
        return "userevents"
    }
    
    public func send(_ classEvent: String, userId: String, eventData: String? = nil, closure: @escaping SMResponse<T>) {
        
        let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/byclass"
        var parameters = self.getQueryParams()
        
        parameters["userId"] = userId
        parameters["eventClass"] = classEvent

        if let eventData = eventData {
            parameters["eventData"] = eventData
        }
        
        self.heandler.request(url: url, method: .post, parameters: parameters) { (item, error) in
            closure(item, error)
        }
    }
    
    public func send(nameEvent: String, userId: String, eventData: String? = nil, closure: @escaping SMResponse<T>) {
        
        let url = String(self.client!.getGatewayUrl() + self.getURI()) + "/byname"
        var parameters = self.getQueryParams()
        
        parameters["userId"] = userId
        parameters["eventName"] = nameEvent
        
        if let eventData = eventData {
            parameters["eventData"] = eventData
        }
        
        self.heandler.request(url: url, method: .post, parameters: parameters) { (item, error) in
            closure(item, error)
        }
    }
}
