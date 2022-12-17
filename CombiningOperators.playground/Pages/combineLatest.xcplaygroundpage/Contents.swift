import UIKit
import Combine

/*
 combine two different publishers.
 both of those publishers can have different types.
 In Example - publisher2 type of string and the publisher1 one has the type of just numbers.
 
 
 And what's going to happen is that.
 Inside your sink, operator, we will to get as a sequence is tuple,
 one element from each of the publishers so you can see that the first one you're getting is (2,a) at the end.
 Now, the reason you're getting to (2,a), the tuple, is that the publisher1 has sent out
 1, but then after that it sent out to the 2. So 2 is the latest one from publisher1,  the publisher2
 to send out a.
 So it combines them together into 2,a then the publisher2 send out b, so it's combined 2,b, then
 the publisher1  sends out 3.
 So if 3,b and so on.
 So the latest value from each of the publisher is combined together into a tuple using the combined
 latest combining operator.
 */

let publisher1 = PassthroughSubject<Int, Never>()
let publisher2 = PassthroughSubject<String,Never>()

publisher1.combineLatest(publisher2)
    .sink {
        print("P1: \($0), P2: \($1)")
}

publisher1.send(1)
publisher2.send("A")
publisher2.send("B")

/*
 Output:-
 
 P1: 1, P2: A
 P1: 1, P2: B
*/
