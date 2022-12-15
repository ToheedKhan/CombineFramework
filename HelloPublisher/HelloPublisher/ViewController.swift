//
//  ViewController.swift
//  HelloPublisher
//
//  Created by Toheed on 15/12/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Imperative programming
        let notification = Notification.Name("MyNotification")
        let center = NotificationCenter.default
        
        let observer = center.addObserver(forName: notification, object: nil, queue: nil) { notification in
            print("Notification received!")
        }
        center.post(name: notification, object: nil)
        center.removeObserver(observer)
    }


}

