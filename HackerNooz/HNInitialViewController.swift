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
                let storiesDispatch = DispatchGroup()
                for (_, result) in results.enumerated() {
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
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            }
            if !errorMessage.isEmpty { print("ERROR FINAL") }
        }
    }
}
