//
//  HNInitial.swift
//  HackerNooz
//
//  Created by Matthew Young on 12/21/18.
//  Copyright © 2018 M. Young. All rights reserved.
//
import UIKit

class HNInitialViewController: UIViewController {
    var initialData: [Int] = []

    override func viewDidLoad() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "HNVC") as! HNViewController
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        HNHttpClientService.shared.getTopStories() { results, errorMessage in
            if let results = results {
                self.initialData = results
                
                var stories: [HNStory] = []
                var paginatedStoryIds: [[Int]] = createInnerSubArrays(fromArray: results, withMaxSubSize: 20)
                let storiesDispatch = DispatchGroup()
                for (_, result) in paginatedStoryIds[0].enumerated() {
                    storiesDispatch.enter()
                    HNHttpClientService.shared.getStory(byId: result) { results, errorMessage in
                        if let results = results {
                            stories.append(results)
                        }
                        storiesDispatch.leave()
                    }
                }
                
                storiesDispatch.notify(queue: .main) {
                    vc.stories  = stories
                    paginatedStoryIds.removeFirst() // We already used the first batch so we can remove it
                    vc.paginatedStoryIds = paginatedStoryIds
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
            if !errorMessage.isEmpty { print("ERROR FINAL") }
        }
    }
}
