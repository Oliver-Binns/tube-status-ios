//
//  JourneyPlanner.swift
//  iOS
//
//  Created by Oliver Binns on 13/10/2021.
//
import Combine
import SwiftUI
import TFLAPI

public struct JourneyPlanner: View {
    @State private var cancellables: [AnyCancellable] = []
    @State private var stations: [Station]?

    @State private var originID: String?
    @State private var destinationID: String?

    @State private var isLoading: Bool = false
    @State private var journeys: [Journey]?

    private let stationService: StationService
    private let journeyService: JourneyService

    public init(stationService: StationService = .init(),
                journeyService: JourneyService = .init()) {
        self.stationService = stationService
        self.journeyService = journeyService
    }

    public var body: some View {
        VStack {
            if let stations = stations {
                Form {
                    Section {
                        StationPicker(title: "Origin",
                                      stations: stations,
                                      id: $originID)
                        StationPicker(title: "Destination",
                                      stations: stations,
                                      id: $destinationID)
                        Button {
                            fetchJourney()
                        } label: {
                            HStack {
                                Image(systemName: "tram.fill")
                                Text("Plan")
                            }
                        }.disabled(originID == nil || destinationID == nil || isLoading)
                    }
                    if isLoading {
                        ProgressView()
                    } else if let journeys = journeys {
                        ForEach(journeys) {
                            JourneyView(journey: $0)
                        }
                    }
                }
            } else {
                ProgressView()
            }
        }.onAppear {
            guard stations == nil else { return }
            stationService.getAllStations()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { stations in
                self.stations = stations
            }).store(in: &cancellables)
        }.pickerStyle(.menu)
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
                isLoading = false
                if case .failure(let error) = completion {
                    print(error)
                }
            } receiveValue: {
                self.journeys = $0
            }
            .store(in: &cancellables)
    }
}
