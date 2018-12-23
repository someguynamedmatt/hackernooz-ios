//
//  ViewController.swift
//  HackerNooz
//
//  Created by Matthew Young on 12/21/18.
//  Copyright © 2018 M. Young. All rights reserved.
//

import UIKit

class HNViewController: UITableViewController {
    var stories: [HNStory] = []

    override func viewDidLoad() {
        self.navigationItem.hidesBackButton = true
        super.viewDidLoad()
        
        tableView.rowHeight = 85.0
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stories.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StoryCellView",
                                                 for: indexPath) as! StoryCellView

        cell.set(story: stories[indexPath.row])
        return cell
    }
}
