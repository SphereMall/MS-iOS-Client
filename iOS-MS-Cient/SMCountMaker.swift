//
//  SMCountMaker.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 12/28/17.
//  Copyright © 2017 SphereMall. All rights reserved.
//

import UIKit

public class CounterSM: Entity, Decodable {
    var meta: Meta?
}

public class SMCountMaker: NSObject {
    
    static func count(object: CounterSM?) -> Int {
        
        if object == nil {
            return 0
        }
        
        if object!.meta == nil {
            return 0
        }
        
        return object!.meta!.count ?? 0
    }
}
