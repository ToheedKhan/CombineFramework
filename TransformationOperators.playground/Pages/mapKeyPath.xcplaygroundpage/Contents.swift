//: [Previous](@previous)

import Foundation
import Combine

/*
 which will allow you to refer
 to the individual keys of the particular object that you're trying to map over.
 */

struct Point {
    let x: Int
    let y: Int
}

let publisher = PassthroughSubject<Point, Never>()

publisher.map(\.x, \.y).sink { x, y in
    print("x is \(x) and y is \(y)")
}

publisher.send(Point(x: 2, y: 10))

