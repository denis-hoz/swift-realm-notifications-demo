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
		super.init(nibName: nil, bundle: nil)
		gitHubAPI = gitHubAPIProviding;
	}
	
	required init?(coder aDecoder: NSCoder) {
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
        return nil
    }

}
