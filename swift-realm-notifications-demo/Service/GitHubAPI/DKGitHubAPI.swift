//
// Created by Denis Kapusta on 6/3/16.
// Copyright (c) 2016 Denis Kapusta Demo. All rights reserved.
//

import Foundation
import RealmSwift

class DKGitHubAPI : DKGitHubAPIProviding {
    let repos: Results<DKRepo> = {
        let realm = try! Realm()
		return realm.objects(DKRepo).sorted("pushedAt", ascending: false)
    }()

    var token: NotificationToken?
}
