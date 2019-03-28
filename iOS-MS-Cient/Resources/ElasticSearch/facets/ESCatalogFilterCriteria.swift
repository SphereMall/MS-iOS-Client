//
//  ESCatalogFilterCriteria.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 1/31/19.
//  Copyright © 2019 SphereMall. All rights reserved.
//

import UIKit

public protocol ESCatalogFilterCriteria {
    func name() -> String
    func update(criteria: ESCatalogFilterCriteria) -> ESCatalogFilterCriteria
    func configuration() -> [String: Any]
    func toJson() throws -> String
    func toQuery() -> [ElasticSearchQuery]
}
