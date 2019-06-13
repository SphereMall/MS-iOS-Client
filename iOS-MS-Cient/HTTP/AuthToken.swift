//
//  AuthToken.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/11/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class AuthToken: NSObject {
    
    let keychain = KeychainSwift()
    
    private var client: SMClient!
    public init(client: SMClient) {
        self.client = client
    }
    
    public final func token() -> String? {
        return keychain.get("smclienttoken")
    }
    
    @discardableResult public func save(token: String) -> Bool {
        return keychain.set(token, forKey: "smclienttoken")
    }
    
    @discardableResult public func delete(token: String) -> Bool {
        return keychain.delete("smclienttoken")
    }
}
