//
//  StoryDetailView.swift
//  HackerNews
//
//  Created by Toheed on 10/02/23.
//

import SwiftUI

struct StoryDetailView: View {
    @ObservedObject private var storyDetailVM: StoryDetailViewModel
    
    var storyId: Int
    
    init(storyId: Int) {
        self.storyId = storyId
//        self.storyDetailVM = StoryDetailViewModel(storyId: storyId)
        self.storyDetailVM = StoryDetailViewModel()
    }
    
    var body: some View {
        VStack {
            Text(self.storyDetailVM.title)
            
            Webview(url: self.storyDetailVM.url)
        }.onAppear {
            self.storyDetailVM.fetchStoryDetails(storyId: self.storyId)
        }
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
//       StoryDetailView()
        StoryDetailView(storyId: 8863)
    }
}
