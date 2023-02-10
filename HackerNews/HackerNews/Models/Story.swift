//
//  Story.swift
//  HackerNews
//
//  Created by Toheed on 10/02/23.
//

import Foundation

struct Story: Codable {
    
    let id: Int
    let title: String
    let url: String
    
}

extension Story {
    
    static func placeholder() -> Story {
        return Story(id: 0, title: "N/A", url: "")
    }
    
}
