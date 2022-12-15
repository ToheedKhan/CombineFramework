//
//  ViewController.swift
//  HelloPublisher
//
//  Created by Toheed on 15/12/22.
//

import UIKit
import Combine

class StringSubscriber: Subscriber {
   
    //Kind of values subscriber can receive
    typealias Input = String
    /// Use `Never` if this `Subscriber` cannot receive errors.

    typealias Failure = Never //Means will never really going to fail
    
    func receive(subscription: Subscription) {
        print("Received Subscription")
        /// Tells a publisher that it may send more values to the subscriber.
        subscription.request(.max(3)) // Backpressure
    }
    func receive(_ input: String) -> Subscribers.Demand {
        print("Received Value", input)
        /// This is equivalent to `Demand.max(0)
//        return .none
        /// A request for as many values as the publisher can produce.
        return .unlimited

        /*
         we are going to go ahead and the value that we received over here, you can see that we have to
        return the demand.
        So this is basically do you want to change the back pressure or do you want to demand more incremented
        more, or do you want to simply say that?
        No, just keep it like that.
        Basically, if you are saying over here on line number 20 that I want three items, you can change that
        to say, oh, by the way, now I need unlimited items, but right now we're turning none, which is
        simply saying that, no, we don't really want to change our demand.
         */
    }
    /*
     This is going to be sent to the subscriber when the publisher is finished publishing the event.
     */
    func receive(completion: Subscribers.Completion<Never>) {
        print("Completed")
    }
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //sendingNotificationUsingNotificationCenter()
//        sendingNotificationUsingPublisherSubscriber()
        
        let publisher = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"].publisher
        
        let subscriber = StringSubscriber()
        
        publisher.subscribe(subscriber)
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
//        subscription.cancel()
       
    }
}

