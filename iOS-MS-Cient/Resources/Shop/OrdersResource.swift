//
//  OrdersResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/19/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit
import Alamofire

public class OrdersResource<T: Decodable>: Resource <OrdersSM> {
    
    override public func getURI() -> String {
        return "orders"
    }
    
    public func byOrderId(orderId: String, closure: @escaping (OrdersSM?, NSError?) -> Swift.Void) {
        getOrderByParam(uriAppend: client!.getGatewayUrl() + getURI() + "/byorderid/\(orderId)") { (order, error) in
            closure(order, error)
        }
    }
    
    public func by(id: String, closure: @escaping (OrdersSM?, NSError?) -> Swift.Void) {
        getOrderByParam(uriAppend: client!.getGatewayUrl() + getURI() + "/byid/\(id)") { (order, error) in
            closure(order, error)
        }
    }

    
    private func getOrderByParam(uriAppend: String, closure: @escaping (OrdersSM?, NSError?) -> Swift.Void) {
        
        let params = getQueryParams()
        
        self.heandler.request(url: uriAppend, method: .get, parameters: params) { (item: OrdersSM?, error: NSError?) in
            closure(item, error)
        }
//
//        $response = $this->handler->handle('GET', false, $uriAppend, $params);
//    
//        $orderCollection = $this->make($response);
//        if ($orderCollection) {
//            $orderFinalized = new OrderFinalized($this->client);
//            $orderFinalized->setOrderData($orderCollection[0]);
//            return $orderFinalized;
//        }
//    
//        return null;
    }
    
    public func getHistory(userId: Int, orderId : Int? = nil, closure: @escaping (OrdersHistorySM?, NSError?) -> Swift.Void) {
        
        let params = getQueryParams()
        var uriAppend = client!.getGatewayUrl() + getURI() + "/history/\(userId)"
        
        if orderId != nil {
            uriAppend = uriAppend + "/\(orderId!)"
        }
    
        heandler.request(url: uriAppend, method: .get, parameters: params) { (item: OrdersHistorySM?, error: NSError?) in
            closure(item, error)
        }
    }
}
