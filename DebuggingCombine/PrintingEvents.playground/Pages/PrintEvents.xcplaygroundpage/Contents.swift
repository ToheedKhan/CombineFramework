import UIKit
import Combine

/*
 First and easiest way to debug combine operators is print operator.
 */

let publisher = (1...20).publisher

/*
 And if I simply go ahead and say publisher.sink and print out the value, it will simply go through the range that I have declared and print out those 20 values.
 That is great.
 But if I want to actually see what kind of different events took place, then I can actually use something called a **print publisher**.
 */
publisher.print("Debugging").sink {
    print($0)
}


/*
 All right, so if you are trying to find a quick way to see what exactly is going on in your publisher,
 in your events, then try using the print operator as we have used, and it's going to give you all
 the different events that are being generated from that particular publisher.
 */
