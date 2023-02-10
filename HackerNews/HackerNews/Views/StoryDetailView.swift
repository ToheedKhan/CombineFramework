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
        self.storyDetailVM = StoryDetailViewModel(storyId: storyId)
    }
    
    var body: some View {
        VStack {
            Text(self.storyDetailVM.title)
        }
    }
}

struct StoryDetailView_Previews: PreviewProvider {
    static var previews: some View {
//       StoryDetailView()
        StoryDetailView(storyId: 8863)
    }
}
