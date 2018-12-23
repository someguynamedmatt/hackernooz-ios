//
//  HNUserModel.swift
//  HackerNooz
//
//  Created by Matthew Young on 12/21/18.
//  Copyright © 2018 M. Young. All rights reserved.
//

import Foundation

class HNUser: NSObject, Codable {
    var about: String
    var created: Int
    var delay: Int
    var id: Int
    var karma: Int
    var submitted: [Int]
}
