//
//  ErrorSM.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 4/30/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class InternalErrorSM: Entity, Decodable {
    public var errors : [Error]?
    public var meta : Meta?
    public var status : String?
    public var ver : String?
}

public class ErrorSM: NSObject {
    public var code: Int!
    public var items : [ErrorItem] = []
    public var meta: Meta?
    public var status : String?
    public var ver : String?
    
    init(internalError: InternalErrorSM?, code: Int?) {
        self.code = code
        guard let errors = internalError?.errors else { return }
        for error in errors {
            self.items.append(ErrorItem(message: error.message, error_code: error.error_code))
        }
    }
    
    init(code: Int?, status : String?) {
        self.code = code
        self.status = status
    }
    
    init(code: Int?, items: [ErrorItem]) {
        self.code = code
        self.items = items
    }
    
    init(code: Int?, items: [ErrorItem], meta: Meta?, status : String?, ver : String?) {
        self.code = code
        self.items = items
        self.meta = meta
        self.status = status
        self.ver = ver
    }
}

public class ErrorItem: NSObject {
    
    public var message: String?
    public var error_code: String?
    
    init(message: String?, error_code: String?) {
        self.message = message
        self.error_code = error_code
    }

}
