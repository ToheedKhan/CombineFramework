import UIKit
import Combine
//works on finite sequences (Collections array or set)
let publisher = [1,-45,3,45,100].publisher

publisher
.max()
    .sink {
        print($0)
}

publisher
.min()
    .sink {
        print($0)
}
