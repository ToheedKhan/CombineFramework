import UIKit

/*
 It's going to append your sequence, your values before the other sequence or before the initial values
 to better understand this.
 */

let numbers = (1...5).publisher
let publisher2 = (500...510).publisher

numbers.prepend(100,101) //variadic parameters
    .prepend(-1,-2)
    .prepend(-11,-12, -13)
    .prepend([45,67])
    .prepend(publisher2)
    .sink {
    print($0)
}
