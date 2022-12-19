//
//  ViewController.swift
//  DebuggingEventsCombineDemo
//
//  Created by Toheed on 19/12/22.
//

import UIKit
import Combine
/*
 And now finally, we are using the debugger as a breakpoint to break on those conditions so you can
 jump into the debugger.
 And depending on the conditions, I would say all this started with the printing and then handle events
 and then debuggers should be our final resort.
 If you cannot figure out with printing the events and handling the events, then obviously debugger
 is your final choice.
 */
class ViewController: UIViewController {
    
    private var cancellable: AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let publisher = (1...10).publisher
        
        self.cancellable = publisher
            .breakpoint(receiveOutput: { value in
                return value > 9
            })
            .sink {
            print($0)
        }
        
//        self.cancellable = publisher
//            .breakpointOnError()
//            .sink {
//            print($0)
//        }
    }
}

