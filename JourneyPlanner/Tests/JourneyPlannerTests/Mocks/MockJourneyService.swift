import Combine
@testable import JourneyPlanner
import TFLAPI

final class MockJourneyService: JourneyServicing {
    var request: (originID: String, destinationID: String)?
    var subject: PassthroughSubject<[Journey], Error> = .init()

    func planJourney(from originID: String,
                     to destinationID: String) -> AnyPublisher<[Journey], Error> {
        request = (originID: originID, destinationID: destinationID)
        return subject.eraseToAnyPublisher()
    }
}
