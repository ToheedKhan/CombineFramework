import UIKit
import Combine
/*
 how by making different subscriptions to
 your publisher, the publisher gets activated and the publisher is going to make a request to download
 the data game, which is going to be left performant for you, because if you have 20 different publishers,
 They're all downloading the same exact data.
 So the question is, how can we share the results of a publisher?

 */
var subscription3: AnyCancellable? = nil

guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
    fatalError("Invalid URL")
}

let request = URLSession.shared.dataTaskPublisher(for: url).map(\.data).print().share()

let subscription1 = request.sink(receiveCompletion: { _ in }, receiveValue: {
    print("Subscription 1")
    print($0)
})

let subscription2 = request.sink(receiveCompletion: { _ in }, receiveValue: {
    print("Subscription 2")
    print($0)
})
/*
 But subscription number three never actually happened because you don't really see subscription number
 three being printed.
 And the reason subscription number three haven't really happened is that after downloading all this
 data and the subscribers, well, it was already too late to make the subscription number three or to
 pass the data or to give some information to the subscriber.
 What we really need is that even though we are subscribing it after that particular publisher is done
 publishing, we do want that publisher to publish the last event to our subscribers, and that is the
 job of a multicast operator.
 */
DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
    subscription3 = request.sink(receiveCompletion: { _ in }, receiveValue: {
        print("Subscription 3")
        print($0)
    })
}
