//
//  ViewController.swift
//  Hello-Subjects
//
//  Created by Toheed on 15/12/22.
//

import UIKit
import Combine

enum MyError: Error {
    case subscriberError
}

class StringSubscriber: Subscriber {
   
    //Kind of values subscriber can receive
    typealias Input = String
    /// Use `Never` if this `Subscriber` cannot receive errors.

    typealias Failure = MyError
    
    func receive(subscription: Subscription) {
        print("Received Subscription")
        subscription.request(.max(2)) // Backpressure
    }
    func receive(_ input: String) -> Subscribers.Demand {
        print("Received Value", input)
//        return .none
        return .max(1)

    }
    /*
     This is going to be sent to the subscriber when the publisher is finished publishing the event.
     */
    func receive(completion: Subscribers.Completion<MyError>) {
        print("Completed")
    }
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //Subjects
           // - Publisher
           // - Subscribers
        let subscriber = StringSubscriber()
        //allows you to publish new values on demand
        let subject = PassthroughSubject<String, MyError>()
        
        subject.subscribe(subscriber)
        //Since subject is publisher as well
        //Below we are subscribing through Subject
        let subscribtion = subject.sink { (completion) in
            print("Received Completion from sink")
        } receiveValue: { value in
            print("Received value from sink", value)

        }

        
        subject.send("A")
        subject.send("B")
        
        subscribtion.cancel()
        
        subject.send("C")
        subject.send("D")


    }


}

