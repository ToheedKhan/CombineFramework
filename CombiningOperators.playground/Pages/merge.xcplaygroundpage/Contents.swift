import UIKit
import Combine


//merge the different events from different publishers.
// when you're combining two different streams together, both of them have to have the same exact time.

let publisher1 = PassthroughSubject<Int, Never>()
let publisher2 = PassthroughSubject<Int, Never>()

publisher1.merge(with: publisher2).sink {
    print($0)
}

publisher1.send(10)
publisher2.send(11)
publisher1.send(12)
