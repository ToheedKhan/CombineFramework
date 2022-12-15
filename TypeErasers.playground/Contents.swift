import UIKit
import Combine
/*
 sometimes we want to hide the details about the
 type of the publisher that we have used.
 So we don't want the client or someone else who is using the publisher to know that they're using a
 pass through subject publisher.
 */
let publisher = PassthroughSubject<Int, Never>().eraseToAnyPublisher()

//publisher.send  Not available
