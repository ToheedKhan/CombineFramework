import UIKit
import Combine

let images = ["Ballon", "Butterfly", "Car"]
var index = 0

func getImage() -> AnyPublisher<UIImage?, Never> {
    /*
     We are going to return a future, which is basically an operator in combine.
     And it really means that the future is going to be returned immediately, but the body of the future will be evaluated after some time.
     The future is going to return you the image.
     */
    
    return Future<UIImage?, Never> { promise in
        
        DispatchQueue.global().asyncAfter(deadline: .now() + 3.0) {
            promise(.success(UIImage(named: images[index])))
            
        }
        }.map { $0 }.receive(on: RunLoop.main).eraseToAnyPublisher()
}

let taps = PassthroughSubject<Void, Never>()

taps.map { _ in getImage() }.switchToLatest().sink {
    print($0)

}
//Ballon
taps.send()

//Butteryfly
DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
    index += 1
    taps.send()
}

//car

DispatchQueue.main.asyncAfter(deadline: .now() + 6.5) {
    index += 1
    taps.send()
}
