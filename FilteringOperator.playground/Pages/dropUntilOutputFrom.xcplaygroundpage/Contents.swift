import UIKit
import Combine
/*
 drop until output from and it's going to drop the events or the value
 from a sequence until it gets an output from another publisher.
 */

let isReady = PassthroughSubject<Void, Never>()
let taps = PassthroughSubject<Int, Never>()

taps.drop(untilOutputFrom: isReady).sink {
    print($0)
}

(1...10).forEach { n in
    taps.send(n)
    
    if n == 3 {
        isReady.send()
    }
    
}
