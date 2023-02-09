//
//  StoryListViewModel.swift
//  HackerNews
//
//  Created by Toheed on 09/02/23.
//

import Foundation
import Combine

class StoryListViewModel: ObservableObject {
    
    /*
     Initializing it,
     Anytime the story is asign, it should publish
     an event telling the user interface that you need to re-render yourself again.
      you can do this with the published property wrapper.
     */
    
    @Published var stories = [StoryViewModel]()
    private var cancellable: AnyCancellable?
    
    init() {
        fetchTopStories()
    }
    
    private func fetchTopStories() {
        
        self.cancellable = Webservice().getAllTopStories().map { storieIds in
            storieIds.map { StoryViewModel(id: $0) }
        }.sink(receiveCompletion: { _ in }, receiveValue: { storyViewModels in
            self.stories = storyViewModels
        })
        
    }
    
}

struct StoryViewModel {
    
    let id: Int
    
    
    
}
