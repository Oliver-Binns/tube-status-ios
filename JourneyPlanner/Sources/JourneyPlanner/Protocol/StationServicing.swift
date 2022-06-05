import Combine
import Foundation
import TFLAPI

public protocol StationServicing {
    func getStations(on line: Line) -> AnyPublisher<[Station], Error>
    func getAllStations() -> AnyPublisher<[Station], Error>
}

extension StationService: StationServicing { }
