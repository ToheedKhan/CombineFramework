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
        
        //sendingNotificationUsingNotificationCenter()
        sendingNotificationUsingPublisherSubscriber()
    }

    func sendingNotificationUsingNotificationCenter() {
        //Imperative programming
        let notification = Notification.Name("MyNotification")
        let center = NotificationCenter.default
        
        let observer = center.addObserver(forName: notification, object: nil, queue: nil) { notification in
            print("Notification recevied!")
        }
        center.post(name: notification, object: nil)
        center.removeObserver(observer)
    }
    
    func sendingNotificationUsingPublisherSubscriber() {
        let notification = Notification.Name("MyNotification")

        let publisher = NotificationCenter.default.publisher(for: notification, object: nil)
        //sink method returns AnyCancelable
        let subscription = publisher.sink { _ in
            print("Notification Recevied")
        }
//        subscription.cancel()
        NotificationCenter.default.post(name: notification, object: nil)
        
       
    }
}

