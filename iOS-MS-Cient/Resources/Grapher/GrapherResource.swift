//
//  GrapherResource.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 3/28/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class GrapherResource<T: Decodable> : Resource <GridSM> {
    
    public override func getQueryParams() -> [String : String] {
        
        var params = super.getQueryParams()
        
        if params["where"] == nil || params["where"] == "" {
            return params
        }
        
        let whereCondition = params["where"]
        params.removeValue(forKey: "where")
        
        let whereArray: [String] = whereCondition!.components(separatedBy: "&")
        
        for item in whereArray {
            let keyValue = item.components(separatedBy: "=")
            params[keyValue[0]] = keyValue[1]
        }
        
        return params
    }
}
