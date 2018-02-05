//
//  AttributesResource.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/9/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class AttributesResource<ProductsSM: Decodable> : Resource <ProductsSM> {
    override func getURI() -> String {
        return "attributes"
    }
    
    public func belong(entityClass: String, attributeGroupId: Int? = nil, attributeId: Int? = nil) {
//    $uriAppend = '/belong/' . strtolower((new \ReflectionClass($entityClass))->getShortName()) . "s";
//    $params = $this->getQueryParams();
//    if (!is_null($attributeGroupId)) {
//    $uriAppend .= "/$attributeGroupId";
//    if (!is_null($attributeId)) {
//    $uriAppend .= "/$attributeId";
//    }
//    }
//
//    $response = $this->handler->handle('GET', false, $uriAppend, $params);
//
//    return $this->make($response);
    }
}
