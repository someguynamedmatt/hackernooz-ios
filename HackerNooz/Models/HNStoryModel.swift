//
//  HNStoryModel.swift
//  HackerNooz
//
//  Created by Matthew Young on 12/21/18.
//  Copyright © 2018 M. Young. All rights reserved.
//

import Foundation

class HNStory: Codable {
    var by: String?
    var descendants: Int?
    var id: Int?
    var kids: [Int]?
    var score: Int?
    var time: Int?
    var title: String?
    var type: String = "story"
    var url: String?
}
