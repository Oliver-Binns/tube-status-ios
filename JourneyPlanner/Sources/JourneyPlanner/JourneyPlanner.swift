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

    private let service: StationService

    public init(service: StationService = .init()) {
        self.service = service
    }

    public var body: some View {
        VStack {
            TextField("From", text: .constant("Oxford Circus"))
                .textFieldStyle(.roundedBorder)
            TextField("To", text: .constant("Oxford Circus"))
                .textFieldStyle(.roundedBorder)

            if let stations = stations {
                ForEach(stations) {
                    StationView(station: $0)
                }.frame(maxWidth: .infinity)
            }
        }.padding().onAppear {
            service.getAllStations()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { error in
                print(error)
            }, receiveValue: { stations in
                self.stations = stations
            }).store(in: &cancellables)
        }
    }
}

struct StationView: View {
    let station: Station

    var body: some View {
        HStack {
            Text(station.name)
            ForEach(station.lines) { line in
                Image(systemName: "circle.fill")
                    .foregroundColor(line.color)
            }
            Spacer()
        }.padding(4)
    }
}
