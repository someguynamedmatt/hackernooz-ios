//
//  StoryCellView.swift
//  HackerNooz
//
//  Created by Matthew Young on 12/22/18.
//  Copyright © 2018 M. Young. All rights reserved.
//

import UIKit

class StoryCellView: UITableViewCell {
    var story: HNStory?
    
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var url: UILabel!
    
    func set(story: HNStory) {
        self.story = story
        print("STORY TITLE: " + story.title!)
        title?.text = story.title!
        if story.url != nil {
            url?.text = story.url!
        }
    }
}
