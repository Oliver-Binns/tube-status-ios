//
//  JourneyView.swift
//  
//
//  Created by Oliver Binns on 16/12/2021.
//
import SwiftUI
import TFLAPI

struct JourneyView: View {
    let journey: Journey

    private let dateFormatter = RelativeDateTimeFormatter()

    func string(date: Date) -> String {
        dateFormatter.localizedString(for: date, relativeTo: .init())
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Departs")
                Text(string(date: journey.departureDate)).fontWeight(.semibold)
            }
            HStack {
                Text("Arrives")
                Text(string(date: journey.arrivalDate)).fontWeight(.semibold)
            }
            Text("Duration: \(journey.duration)")

            Text(journey.legs.first!.origin)
            ForEach(journey.legs) { leg in
                HStack {
                    HStack {
                        Text("|").fontWeight(.black)
                        switch leg.mode {
                        case .walking:
                            Image(systemName: "figure.walk")
                        case .tube, .overground:
                            Image(systemName: "tram.fill")
                        }
                    }.foregroundColor(leg.line?.color ?? .primary)
                    Text("\(leg.duration) min")
                }
                Text(leg.destination)
            }
        }
    }
}
