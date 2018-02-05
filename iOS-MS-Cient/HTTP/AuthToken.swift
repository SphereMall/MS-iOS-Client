//
//  AuthToken.swift
//  iOS-MS-Client
//
//  Created by Nazar Gorobets on 1/11/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

class AuthToken: NSObject {
    
    let keychain = KeychainSwift()
    
    private var client: SMClient!
    public init(client: SMClient) {
        self.client = client
    }
    
    public final func token() -> String? {
        return keychain.get(client.getClientId())
    }
    
    @discardableResult func save(token: String) -> Bool {
        return keychain.set(token, forKey: client.getClientId())
    }
    
    @discardableResult func delete(token: String) -> Bool {
        return keychain.delete(client.getClientId())
    }
}
