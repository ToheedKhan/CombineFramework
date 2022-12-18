import UIKit
import Combine

let publisher = ["A","B","C","D"].publisher

let publisher1 = PassthroughSubject<Int, Never>()

publisher.count().sink {  print($0)
}
publisher1.count().sink {  print($0)
}
publisher1.send(10)
publisher1.send(10)
publisher1.send(10)
publisher1.send(10)
publisher1.send(0)

publisher1.send(completion: .finished)
