//
// Created by Denis Kapusta on 6/3/16.
// Copyright (c) 2016 Denis Kapusta Demo. All rights reserved.
//

import Foundation
import RealmSwift

protocol DKGitHubAPIProviding {
	var repos: Results<DKRepo> { get }
	var token: NotificationToken? { get }
}
