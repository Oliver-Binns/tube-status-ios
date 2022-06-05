import Combine
import SwiftUI
import TFLAPI

public struct JourneyPlanner: View {
    @ObservedObject private var viewModel: JourneyPlannerViewModel

    public init(viewModel: JourneyPlannerViewModel = .init()) {
        self.viewModel = viewModel
    }

    public var body: some View {
        VStack {
            if let stations = viewModel.stations {
                Form {
                    Section {
                        StationPicker(title: "Origin",
                                      stations: stations,
                                      id: $viewModel.originID)
                        StationPicker(title: "Destination",
                                      stations: stations,
                                      id: $viewModel.destinationID)
                        Button {
                            viewModel.fetchJourney()
                        } label: {
                            HStack {
                                Text("Plan")
                                Image(systemName: "arrow.up.right")
                            }
                        }.disabled(viewModel.isButtonDisabled)
                    }
                    if viewModel.isLoading {
                        ProgressView()
                    } else if let journeys = viewModel.journeys {
                        ForEach(journeys) {
                            JourneyView(journey: $0)
                        }
                    }
                }
            } else {
                ProgressView()
            }
        }
        .onAppear(perform: viewModel.fetchStations)
        .pickerStyle(.menu)
    }
}
