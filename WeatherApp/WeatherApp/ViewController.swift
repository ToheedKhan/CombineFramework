//
//  ViewController.swift
//  WeatherApp
//
//  Created by Toheed on 19/12/22.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    
    private var webservice: Webservice = Webservice()
    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        self.cancellable = self.webservice.fetchWeather(city: "Houston")
            .catch { _ in Just(Weather.placeholder) }
            .map { weather in
                if let temp = weather.temp {
                    return "\(temp) ℉"
                } else {
                    return "Error getting weather!"
                }
        }.assign(to: \.text, on: self.temperatureLabel)
        
    }
}

