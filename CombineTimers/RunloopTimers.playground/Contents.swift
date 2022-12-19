import UIKit
import Combine

/*
The main purpose of creating these timers are scheduling a task is that you can either do a task after a couple of seconds, a couple of minutes after some interval, or you can even do repeated tasks like every five seconds
*/

let runLoop = RunLoop.main

let subscription = runLoop.schedule(after: runLoop.now, interval: .seconds(2) , tolerance: .milliseconds(100)) {
    
    print("Timer fired")
    
}

runLoop.schedule(after: .init(Date(timeIntervalSinceNow: 3.0))) {
    subscription.cancel()
}

