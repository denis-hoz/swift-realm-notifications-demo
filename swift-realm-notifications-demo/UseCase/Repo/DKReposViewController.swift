//
//  DKReposViewController.swift
//  swift-realm-notifications-demo
//
//  Created by Denis Kapusta on 6/3/16.
//  Copyright (c) 2016 Denis Kapusta Demo. All rights reserved.
//


import UIKit


class DKReposViewController: UIViewController {
	let gitHubAPI: DKGitHubAPIProviding
	
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
    // Do any additional setup after loading the view, typically from a nib.
    }


    override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
    }
}

extension DKReposViewController: UITableViewDataSource {
    @available(iOS 2.0, *) func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gitHubAPI.repos.count
    }

    @available(iOS 2.0, *) func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("DKRepoTableViewCell", forIndexPath: indexPath) as! DKRepoTableViewCell
		cell.updateWithRepo(gitHubAPI.repos[indexPath.row])
		
        return cell
    }

}
