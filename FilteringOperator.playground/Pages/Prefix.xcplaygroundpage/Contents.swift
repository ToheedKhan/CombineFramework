import UIKit
import Combine
/*
 to limit the values, what
 kind of values or what amount of values passes through.
 And one of the first operators that we are going to look at is the prefix operator.
 */
let numbers = (1...10).publisher

/*
 passing in two simply means that the two initial values of that particular publisher.
 */
numbers.prefix(2).sink {
    print($0)
}

numbers.prefix(while: { $0 < 3 }).sink {
    print($0)
}



