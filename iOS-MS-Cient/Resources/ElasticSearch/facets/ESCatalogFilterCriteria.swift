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

/*
 
 {
 "size": "20",
 "query": {
 "bool": {
 "must": [
 {
 "terms": {
 "isMain": [
 "1"
 ]
 }
 },
 {
 "terms": {
 "channelIds": [
 "5"
 ]
 }
 },
 {
 "terms": {
 "reward_attr.attributeValue": ["0"]
 }
 }
 ]
 }
 },
 "_source": "scope",
 "sort": [
 {
 "3_factorValues.value": {
 "order": "desc"
 }
 }
 ]
 }
 
 */
