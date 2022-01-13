import Combine
import Foundation
import TFLAPI

public protocol JourneyServicing {
    func planJourney(from originID: String,
                     to destinationID: String) -> AnyPublisher<[Journey], Error>
}

extension JourneyService: JourneyServicing { }
