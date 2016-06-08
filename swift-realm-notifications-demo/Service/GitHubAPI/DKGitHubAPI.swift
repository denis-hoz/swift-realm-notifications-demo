//
// Created by Denis Kapusta on 6/3/16.
// Copyright (c) 2016 Denis Kapusta Demo. All rights reserved.
//

import Foundation
import RealmSwift
import Networking
import AFDateHelper
import ObjectMapper

class DKGitHubAPI : DKGitHubAPIProviding {
    let realm = try! Realm()
    let restClient = DKRESTClient()

}

extension DKGitHubAPI {
    // MARK: fetch
    func fetch() {
        restClient.fetchRepos { [weak self] (JSON, error) in
            guard let JSON = JSON as? Array<[String: AnyObject]> else { return }
            guard let repos = self?.jsonToRepos(JSON) else { return }
            self?.persistRepos(repos)
        }
    }
    
    func jsonToRepos(jsonRepos: Array<[String: AnyObject]>) -> [DKRepo] {
        return jsonRepos.flatMap( Mapper<DKRepo>().map )
    }
}

extension DKGitHubAPI {
    // MARK: persist
    func persistRepos(repos: [DKRepo]) {
        try! realm.write {
            repos.forEach( addOrUpdateRepo )
        }
    }
    
    func addOrUpdateRepo(repo: DKRepo) {
        realm.add(repo, update: true)
    }
}
