//
//  HNHttpClientService.swift
//  HackerNooz
//
//  Created by Matthew Young on 12/21/18.
//  Copyright © 2018 M. Young. All rights reserved.
//

import Foundation

class HNHttpClientService {
    static let shared = HNHttpClientService()

    typealias QueryResult = (HNStory?, String) -> ()
    var errorMessage = ""
    let defaultSession = URLSession(configuration: .default)
    var dataTask: URLSessionDataTask?
    
    func getStory(byId id: Int = 8863, completion: @escaping QueryResult) {
        dataTask?.cancel()
        let sessionConfig = URLSessionConfiguration.default
        // Session Configuration
        let sessionUrl = URLSession(configuration: sessionConfig)
        // Load configuration into Session
        let url = URL(string: "https://hacker-news.firebaseio.com/v0/item/\(id).json")!
        let task = sessionUrl.dataTask(with: url) { data, response, error in
            defer { self.dataTask = nil }
            if error != nil {
                self.errorMessage += "DataTask error: " + error!.localizedDescription + "\n"
            } else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any] {
                        let decoder = JSONDecoder()
                        let story = try! decoder.decode(HNStory.self, from: data!)
                        DispatchQueue.main.async {
                            completion(story, self.errorMessage)
                        }
                    }
                } catch {
                    print("[ERROR]: Could not format JSON (getStory)")
                }
            }
        }
        task.resume()
    }
    
    func getTopStories(completion: @escaping ([Int]?, String) -> ()) {
        dataTask?.cancel()
        let sessionConfig = URLSessionConfiguration.default
        let sessionUrl = URLSession(configuration: sessionConfig)
        let url = URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json")!
        let task = sessionUrl.dataTask(with: url) { data, response, error in
            defer { self.dataTask = nil }
            if error != nil {
                self.errorMessage += "DataTask error: " + error!.localizedDescription + "\n"
            } else {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [Int] {
                        DispatchQueue.main.async {
                            completion(json, self.errorMessage)
                        }
                    }
                } catch {
                    print("[ERROR]: Could not format JSON (getTopStories)")
                }
            }
        }
        task.resume()
    }
}
