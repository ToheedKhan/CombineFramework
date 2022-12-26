//
//  Constants.swift
//  WeatherApp
//
//  Created by Toheed on 22/12/22.
//

import Foundation


struct Constants {
    
    struct URLs {
        
        static func weather(city: String) -> String {
            return "http://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=ef0fd9866ca027e0dca474cee84c53be&units=imperial"
        }
//        static func weather(city: String) -> String {
//            return "http://api.openweathermap.org/data/2.5/weather?q=Boston&appid=ef0fd9866ca027e0dca474cee84c53be&units=imperial"
//        }
        // celsius = metric
        
    }
    
}
