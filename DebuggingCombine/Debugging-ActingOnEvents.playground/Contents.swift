import UIKit
/*
 some time, you want a little bit more details as just by using
 the print is not going to solve your problems.
 Eg. if you are doing some sort of a network request and you see that the network is not going through.
 So how do you handle those kind of scenarios?
 Let's go ahead and take a look at by using action on events.

 */
/*
 Sometime when We are performing asynchronous operation.
 Most commonly we are retrieving or doing some sort of a network operation, and sometimes it fails and
 it's very hard to debug that.
 What exactly is going on now in this particular video?
 I'm going to show you that how you can use something called handle events and print out different kind
 of events that are going on so that you will have a much better idea of where it went wrong.
 */

guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
    fatalError("Invalid URL")
}

let request = URLSession.shared.dataTaskPublisher(for: url)

let subscription = request
    .handleEvents(receiveSubscription: { _ in print("Subscription Received") }, receiveOutput: { _, _ in
        print("Received Output")
    }, receiveCompletion: { _ in print("Received Completion") }, receiveCancel: { print("Received Cancel") }, receiveRequest: {_ in print("Received Request") })
    .sink(receiveCompletion: {  print($0) }, receiveValue: { data, response in
    print(data)
})
