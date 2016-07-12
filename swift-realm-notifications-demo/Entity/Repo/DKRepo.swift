//
// Created by Denis Kapusta on 6/3/16.
// Copyright (c) 2016 Denis Kapusta Demo. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class DKRepo : Object, Mappable {
    // MARK: properties
    dynamic var name = ""
    dynamic var id: Int = 0
    dynamic var stars = 0
    dynamic var pushedAt: NSDate = NSDate(timeIntervalSince1970: 0)

    // MARK: meta
	override class func primaryKey() -> String? { return "id" }
    
    // MARK: Mappable
    convenience required init?(_ map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        name <- map["name"]
        id <- map["id"]
        stars <- map["stargazers_count"]
        pushedAt <- (map["pushed_at"], ISO8601DateTransform())
    }
}
