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
        setupPublishers()
        /*self.cancellable = self.webservice.fetchWeather(city: "Houston")
         .catch { _ in Just(Weather.placeholder) }
         .map { weather in
         if let temp = weather.temp {
         return "\(temp) ℉"
         } else {
         return "Error getting weather!"
         }
         }.assign(to: \.text, on: self.temperatureLabel)
         */
    }
    
    private func setupPublishers() {
        
    let publisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self.cityTextField)
        
    self.cancellable = publisher.compactMap {
            ($0.object as! UITextField).text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        }.debounce(for: .milliseconds(500), scheduler: RunLoop.main)
            .flatMap { city in
                return self.webservice.fetchWeather(city: city)
                    .catch { _ in Just(Weather.placeholder) }
                /*
                 Since we are using 'eraseToAnyPublisher'
                 it allows you to catch some sort of error if you want to.
                 In our case, we don't really care about the error, but if there is an error, we are simply going
                 to return the placeholder.
                 A placeholder is simply going to allow us to see that the weather in this case will be null and then
                 the humidity and the temperature will be no.
                 */
                    .map { $0 }
             
        }.sink {
            
            if let temp = $0.temp {
                self.temperatureLabel.text = "\(temp) ℉"
            } else {
                self.temperatureLabel.text = ""
            }
        }
    }

}

