import Combine
@testable import JourneyPlanner
import TFLAPI

final class MockStationService: StationServicing {
    var requestedLine: Line?
    var requestedAll: Bool = false

    var subject: PassthroughSubject<[Station], Error> = .init()

    func getStations(on line: Line) -> AnyPublisher<[Station], Error> {
        requestedLine = line
        return subject.eraseToAnyPublisher()
    }

    func getAllStations() -> AnyPublisher<[Station], Error> {
        requestedAll = true
        return subject.eraseToAnyPublisher()
    }
}
