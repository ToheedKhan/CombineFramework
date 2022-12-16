import UIKit
import Combine

let numbers = (1...10).publisher

numbers.drop(while: { $0 % 3 != 0})
    .sink {
        print($0)
}
