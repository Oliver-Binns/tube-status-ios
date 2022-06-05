import Combine
import Foundation
import TFLAPI

public final class JourneyPlannerViewModel: ObservableObject {
    private var cancellables: [AnyCancellable] = []

    private let stationService: StationServicing
    private let journeyService: JourneyServicing

    @Published private(set) var stations: [Station]?

    @Published var originID: String?
    @Published var destinationID: String?

    @Published private(set) var isLoading: Bool = false
    @Published private(set) var journeys: [Journey]?

    var isButtonDisabled: Bool {
        originID == nil || destinationID == nil || isLoading
    }

    public init(stationService: StationServicing = StationService(),
                journeyService: JourneyServicing = JourneyService()) {
        self.stationService = stationService
        self.journeyService = journeyService
    }

    func fetchStations() {
        guard stations == nil else { return }
        stationService
            .getAllStations()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { stations in
                self.stations = stations
            })
            .store(in: &cancellables)
    }

    func fetchJourney() {
        guard let originID = originID,
            let destinationID = destinationID else {
            return
        }
        isLoading = true
        journeyService
            .planJourney(from: originID, to: destinationID)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.isLoading = false
                if case .failure(let error) = completion {
                    print(error)
                }
            } receiveValue: {
                self.journeys = $0
            }
            .store(in: &cancellables)
    }
}
