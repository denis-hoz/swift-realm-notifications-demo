//
// Created by Denis Kapusta on 6/3/16.
// Copyright (c) 2016 Denis Kapusta Demo. All rights reserved.
//

import Foundation
import RealmSwift

class DKRepo : Object {
    //MARK: properties
    dynamic var name = ""
    dynamic var id: Int = 0
    dynamic var stars = 0
    dynamic var pushedAt: NSTimeInterval = 0

    //MARK: meta
	override class func primaryKey() -> String? { return "id" }
}
