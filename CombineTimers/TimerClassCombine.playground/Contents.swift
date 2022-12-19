import UIKit
import Combine

/*
 There are multiple modes available. common as default.
 
 But other modes are default, which means it will handle the input sources that are not  NSConnection
 objects.
 The one that we are using is common, which handles a set of runloop modes for which you can define a
 set of sources, timers and observers and so many different things.
 And then the last one is tracking, which handles the responsive user interface.
 */

let subscription = Timer.publish(every: 1.0, on: .main, in: .common)
                    .autoconnect()

    .scan(0) { counter, _ in
        counter + 1
}
    .sink {
        print($0)
}
