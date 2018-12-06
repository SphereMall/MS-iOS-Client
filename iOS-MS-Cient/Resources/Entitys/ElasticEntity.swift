//
//  ElasticEntity.swift
//  iOS-MS-Cient
//
//  Created by Nazar Gorobets on 12/5/18.
//  Copyright © 2018 SphereMall. All rights reserved.
//

import UIKit

public class ElasticEntity: Codable {
    public var took: Int?
    public var timed_out: Bool?
    public var _shards: EShards?
    public var hits: EHits?
}

public class EShards: Codable {
    public var total: Int?
    public var successful: Int?
    public var skipped: Int?
    public var failed: Int?
}

public class EHits: Codable {
    public var total: Int?
    public var max_score: Double?
    public var hits: [EHit]?
}

public class EHit: Codable {
    public var _index: String?
    public var _type: String?
    public var _id: String?
    public var _score: Double?
    public var _source: ESource?
}

public class ESource: Codable {
    public var scope: String?
}
