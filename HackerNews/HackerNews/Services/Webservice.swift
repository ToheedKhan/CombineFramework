//
//  Webservice.swift
//  HackerNews
//
//  Created by Toheed on 09/02/23.
//

import Foundation
import Combine

class Webservice {
    
    func getStoryById(storyId: Int) -> AnyPublisher<Story, Error> {
        
        guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/item/\(storyId).json?print=pretty") else {
            fatalError("Invalid URL")
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data) //Key value coding
            .decode(type: Story.self, decoder: JSONDecoder())
//            .catch { _ in Empty<Story, Error>() } //This should be done at client side
            .eraseToAnyPublisher()
    }
    
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
