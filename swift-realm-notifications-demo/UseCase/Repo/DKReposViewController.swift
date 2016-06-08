//
//  DKReposViewController.swift
//  swift-realm-notifications-demo
//
//  Created by Denis Kapusta on 6/3/16.
//  Copyright (c) 2016 Denis Kapusta Demo. All rights reserved.
//

import UIKit
import RealmSwift

class DKReposViewController: UIViewController {
    let repos: Results<DKRepo> = {
        let realm = try! Realm()
        return realm.objects(DKRepo).sorted("pushedAt", ascending: false)
    }()
    var token: NotificationToken?
	let gitHubAPI: DKGitHubAPIProviding
	@IBOutlet var tableView: UITableView!
	
	init(gitHubAPIProviding: DKGitHubAPIProviding) {
		gitHubAPI = gitHubAPIProviding
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder aDecoder: NSCoder) {
		gitHubAPI = DKGitHubAPI()
		super.init(coder: aDecoder)
	}

    override func viewDidLoad() {
        super.viewDidLoad()
        addNotifications()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        gitHubAPI.fetch()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DKReposViewController {
    func addNotifications() {
        token = repos.addNotificationBlock { [weak self] (changes: RealmCollectionChange) in
            guard let tableView = self?.tableView else { return }
            
            switch changes {
            case .Initial:
                tableView.reloadData()
                break
            case .Update( _, _, let insertions, _):
                guard let indexPathsForInsertions = self?.indexPaths(forInsertions: insertions) else {return}
                
                tableView.beginUpdates()
                
                tableView.insertRowsAtIndexPaths(indexPathsForInsertions, withRowAnimation: .Automatic)
                
                tableView.endUpdates()
                break
            case .Error(let error):
                print(error)
                break
            }
        }
    }

    func indexPaths(forInsertions insertions: [Int]) -> [NSIndexPath] {
        return insertions.map( indexPathForRow )
    }
    
    func indexPathForRow(row: Int) -> NSIndexPath {
        return NSIndexPath(forRow: row, inSection: 0)
    }
}

extension DKReposViewController: UITableViewDataSource {
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repos.count
    }

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("DKRepoTableViewCell", forIndexPath: indexPath) as! DKRepoTableViewCell
		cell.updateWithRepo(repos[indexPath.row])
		
        return cell
    }

}

extension DKReposViewController: UITableViewDelegate {
    
}
