import UIKit

guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
    fatalError("Invalid URL")
}

let request = URLSession.shared.dataTaskPublisher(for: url).map(\.data).print()

let subscription1 = request.sink ( receiveCompletion: { _ in },
 receiveValue: { print($0)
})

let subscription2 = request.sink(receiveCompletion: { _ in }, receiveValue: {
    print($0)
})

/*
Here first publisher obviously downloaded the data you can see received the value.
 But the second subscription since it subscribes to the publisher also go ahead and download the
 data.
 This is obviously time consuming and this is not a good idea because the data was already downloaded
 by the first subscription.
 */

/*
 Wouldn't it be nice if we can simply download or execute the publisher once, download the data, and
 then whenever we have a new subscriber, we will just hand over the sequence, the data to them, and
 then they don't have to download it again?
 Well, you can do that using the share operator.
 */
