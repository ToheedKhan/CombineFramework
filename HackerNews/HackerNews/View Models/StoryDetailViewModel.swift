//
//  StoryDetailViewModel.swift
//  HackerNews
//
//  Created by Toheed on 10/02/23.
//

import Foundation

import Combine
//ObservableObject to tell UI to update, when fetching story is done
class StoryDetailViewModel: ObservableObject {
    
    private var cancellable: AnyCancellable?
    
    @Published private var story = Story.placeholder()
    
    func fetchStoryDetails(storyId: Int) {
         print("about to make a network request")
        self.cancellable = Webservice().getStoryById(storyId: storyId)
                  .catch { _ in Just(Story.placeholder()) }
                  .sink(receiveCompletion: { _ in }, receiveValue: { story in
                      self.story = story
        })
    }
}

extension StoryDetailViewModel {
    
    var title: String {
        
        return self.story.title
    }
    
    var url: String {
        return self.story.url
    }
}
