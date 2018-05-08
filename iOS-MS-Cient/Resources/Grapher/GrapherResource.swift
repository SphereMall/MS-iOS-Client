//
//  GrapherResource.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 3/28/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class GrapherResource <T: Decodable> : Resource <GridSM> {
    
    public override func getQueryParams() -> [String : String] {
        
        var params = super.getQueryParams()
        params.removeValue(forKey: "where")
    
        if let gridFilter = filter as? GridFilter {
            var gridParams = gridFilter.toParams()
            gridParams.merge(params, uniquingKeysWith: { (value, valueq) -> String in
                return value
            })
            return gridParams
        }

        return params
    }
}
