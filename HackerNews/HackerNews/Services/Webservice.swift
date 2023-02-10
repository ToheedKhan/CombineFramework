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
    
    private func mergeStories(ids storyIds: [Int]) -> AnyPublisher<Story, Error> {
        
        let storyIds = Array(storyIds.prefix(50))
        
        let initialPublisher = getStoryById(storyId: storyIds[0])
        //    since we have already passed the first one, we don't want that to be part of our remainder,
        let remainder = Array(storyIds.dropFirst())
        // getStoryById will return a publisher that we want to merge it with.
        return remainder.reduce(initialPublisher) { combined, id in
            return combined.merge(with: getStoryById(storyId: id))
            .eraseToAnyPublisher()
        }
    }
    

    
    func getAllTopStories() -> AnyPublisher<[Story], Error> {
        
        guard let url = URL(string: "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty") else {
            fatalError("Invalid URL")
        }
        /*
         in order to flatten your publisher, to get a result from an inner publisher, you have to use flat map
         */
        return URLSession.shared.dataTaskPublisher(for: url)
            .receive(on: RunLoop.main)
            .map(\.data) //Key value coding
            .decode(type: [Int].self, decoder: JSONDecoder())
            .flatMap { storyIds in
                return self.mergeStories(ids: storyIds)
            }.scan([]) { stories, story -> [Story] in
                return stories + [story]
            }
            .eraseToAnyPublisher()
    }
}
