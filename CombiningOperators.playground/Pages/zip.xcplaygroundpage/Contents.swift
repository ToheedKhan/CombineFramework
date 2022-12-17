import UIKit
import Combine
/*
 Operator is very similar to combineLatest, but it's also a little bit different and the
 reason is that, it pair and different elements or different item of value from the publisher.
 But it is not going to wait for the latest one.
 So in this example, we have a publisher2, which is emitting A, B, C, D, which are string
 values and publisher1, which is emitting 1, 2, 3, 4 integer values.
 So the zip operator is simply going to pick and try to pair depending on the values that it is receiving
 from both publishers.
 So you can see that the final output is actually 1,A for the first value from the publisher1 and the first value from Publisher2 is going to be grouped together in a tuple and given to you.
 The second value, which is to from 2 publisher1 and B from Publisher2 are going to be to pull together.
 3 from publisher1 and C from publisher2, but look at what happened to the D, which is
 from publisher2 and D is not really a tuple with anything because publisher1 never really emitted
 the 4th value.
 So you never really get the pair or the tuple, so basically the zip operator, it's trying to pair
 the values, as the values emitted from both the publishers.
 */
let publisher1 = PassthroughSubject<Int, Never>()
let publisher2 = PassthroughSubject<String, Never>()

publisher1.zip(publisher2).sink {
    print("P1: \($0), P2: \($1)")
}

publisher1.send(1)
publisher1.send(2)
publisher2.send("3")
publisher2.send("4")
publisher2.send("5") //will not print
//publisher1.send(0)
