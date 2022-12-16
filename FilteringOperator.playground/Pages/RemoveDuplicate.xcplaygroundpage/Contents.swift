import UIKit
import Combine
//Check the sequence
let words = "apple apple apple fruit fruit apple apple mango watermelon apple".components(separatedBy: " ").publisher

words
    .removeDuplicates()
    .sink {
    print($0)
}
/*
 apple
 fruit
 apple
 mango
 watermelon
 apple
 */
