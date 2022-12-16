//: [Previous](@previous)

import Foundation
import Combine

["A","B",nil,"C"].publisher.replaceNil(with: "*")
    .sink {
        print($0)
}


/*
 Unwrapping the optional Values reei
 */

["A","B",nil,"C"].publisher.replaceNil(with: "*")
    .map { $0! }
    .sink {
        print($0)
}
