//
//  StoryListView.swift
//  HackerNews
//
//  Created by Toheed on 09/02/23.
//

import SwiftUI
//Navigation Bar - iOS 16
//https://sarunw.com/posts/swiftui-navigation-bar-color/#:~:text=To%20change%20a%20navigation%20bar%20color%20in%20SwiftUI%2C%20you%20apply,the%20background%20of%20the%20bar.
struct StoryListView: View {
    
    /*
     The reason we are decorating it with ObservedObject is that in the StoryListViewModel,
     we have stories as our property, which is marked with published.
     */
    
    @ObservedObject private var storyListVM = StoryListViewModel()
    
    init() {
            // this is not the same as manipulating the proxy directly
//            let appearance = UINavigationBarAppearance()
        
//        appearance.backgroundColor = UIColor(displayP3Red: 255/255, green: 102/255, blue: 0/255, alpha: 1.0)
//
            
            // this overrides everything you have set up earlier.
//            appearance.configureWithTransparentBackground()
            
//            // this only applies to big titles
//            appearance.largeTitleTextAttributes = [
//                .font : UIFont.systemFont(ofSize: 20),
//                NSAttributedString.Key.foregroundColor : UIColor.white
//            ]
//        appearance.largeTitleTextAttributes = [
//
//            NSAttributedString.Key.foregroundColor : UIColor.white
//        ]
            // this only applies to small titles
//            appearance.titleTextAttributes = [
//                .font : UIFont.systemFont(ofSize: 20),
//                NSAttributedString.Key.foregroundColor : UIColor.white
//            ]
        
//        appearance.titleTextAttributes = [
//            NSAttributedString.Key.foregroundColor : UIColor.white
//        ]
            
//            //In the following two lines you make sure that you apply the style for good
//            UINavigationBar.appearance().scrollEdgeAppearance = appearance
//            UINavigationBar.appearance().standardAppearance = appearance
//
            // This property is not present on the UINavigationBarAppearance
            // object for some reason and you have to leave it til the end
//            UINavigationBar.appearance().tintColor = .white
            
        }
    
    var body: some View {
        
        NavigationStack {
          
//            ZStack {
//                            Color.black
//                                .edgesIgnoringSafeArea([.all])
//
//                        }
            List (self.storyListVM.stories, id: \.id) {
                storyVM in
                NavigationLink(destination: StoryDetailView(storyId: storyVM.id)) {
                    Text("\(storyVM.title)")
                }
            }
            .navigationTitle("Hacker News")
            .toolbarBackground(.visible, for: .navigationBar)

            .toolbarBackground(

                // 1
                Color.pink,
                // 2
                for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)

//            .navigationBarTitle("HackerNews")
        }
        
        /*
         NavigationView {
             
             List(self.storyListVM.stories, id: \.id) { storyVM in
                 NavigationLink(destination: StoryDetailView(storyId: storyVM.id)) {
                     Text("\(storyVM.title)")
                 }
             }
             
         .navigationBarTitle("Hacker News")
         }
         */
    }
}

struct StoryListView_Previews: PreviewProvider {
    static var previews: some View {
        StoryListView()
    }
}
