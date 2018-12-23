//
//  HNCommentModel.swift
//  HackerNooz
//
//  Created by Matthew Young on 12/21/18.
//  Copyright © 2018 M. Young. All rights reserved.
//

import Foundation

class HNComment: NSObject, Codable {
    var by: String
    var id: Int
    var kids: [Int]
    var parent: Int
    var text: String
    var time: Int
    var type: String = "comment"
}
