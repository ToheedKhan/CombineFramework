//
//  Weather.swift
//  WeatherApp
//
//  Created by Toheed on 22/12/22.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    
    let temp: Double?
    let humidity: Double?
    
    /*
     This will be useful in places where we are not able to get the weather.
     Maybe the weather service is down or maybe there are some other issues.
     So in those cases, we can actually return a particular weather where temp is nil and humidity is nil.
     
     Basically, we were not able to fetch the weather temperature and humidity also.
     
     So this will be useful in those cases where maybe we provided the wrong Api key or we provided the wrong
     city name.That doesn't really exist.
     
     So in all of those scenarios, we can actually use the weather placeholder to just place nil values or don't display the weather at all.
     */
    static var placeholder: Weather {
        return Weather(temp: nil, humidity: nil)
    }
    
}
