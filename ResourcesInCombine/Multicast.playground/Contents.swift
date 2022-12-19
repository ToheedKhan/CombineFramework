import UIKit
import Combine

/*by creating a share operator, we can share the result of the subscription,
the sequence with other subscriptions.
So basically the result of the publisher, we can start sharing it with other subscription, and that
is great.
The problem arises if you subscribe to the publisher after a couple of seconds when that publisher has
already done the job, then the new subscription is not going to get the values.
We can fix that, but we will have to use something called the multicast.
*/



guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
    fatalError("Invalid URL")
}

let subject = PassthroughSubject<Data, URLError>()

let request = URLSession.shared.dataTaskPublisher(for: url).map(\.data).print().multicast(subject: subject)

let subscription1 = request.sink(receiveCompletion: { _ in }, receiveValue: {
    print("Subscription 1")
    print($0)
})

let subscription2 = request.sink(receiveCompletion: { _ in }, receiveValue: {
    print("Subscription 2")
    print($0)
})

    
let subscription3 = request.sink(receiveCompletion: { _ in }, receiveValue: {
        print("Subscription 3")
        print($0)
})
//this is the point where the multicast operator is going to connect all of these subscriptions together.
// connect function on the multicast, that is going to allow you to connect
all of the subscriptions with the provider or the publisher.
request.connect()
subject.send(Data())




