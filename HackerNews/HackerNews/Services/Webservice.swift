//
//  Webservice.swift
//  HackerNews
//
//  Created by Toheed on 09/02/23.
//

import Foundation
import Combine

class Webservice {
    
    func getAllTopStories() -> AnyPublisher<[Int], Error> {
        
        guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty") else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data)
            .decode(type: [Int].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
