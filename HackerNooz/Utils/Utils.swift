//
//  Utils.swift
//  HackerNooz
//
//  Created by Matthew Young on 12/27/18.
//  Copyright © 2018 M. Young. All rights reserved.
//

import Foundation

func createInnerSubArrays(fromArray masterArray: [Int], withMaxSubSize size: Int) -> [[Int]] {
    var arrayOfArrays: [[Int]] = []
    var subArray: [Int] = []
    var j = 0
    for (index, item) in masterArray.enumerated() {
        if j < size {
            subArray.append(item)
            j = j + 1
        }
        if j >= size {
            arrayOfArrays.append(subArray)
            subArray = []
            j = 0
        }
        if (j < size) && (index == masterArray.count - 1) {
            arrayOfArrays.append(subArray)
        }
    }
    return arrayOfArrays
}
