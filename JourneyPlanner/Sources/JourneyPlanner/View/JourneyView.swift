//
//  JourneyView.swift
//  
//
//  Created by Oliver Binns on 16/12/2021.
//
import BaseUI
import SwiftUI
import TFLAPI

struct JourneyView: View {
    let journey: Journey

    private let dateFormatter = RelativeDateTimeFormatter()

    func string(date: Date) -> String {
        dateFormatter.localizedString(for: date, relativeTo: .init())
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(alignment: .leading) {
                HStack {
                    Text("Departs")
                    Text(string(date: journey.departureDate)).fontWeight(.semibold)
                }
                HStack {
                    Text("Arrives")
                    Text(string(date: journey.arrivalDate)).fontWeight(.semibold)
                }
            }

            Text("Total Duration: \(journey.duration) min")

            VStack(alignment: .leading) {
                if let origin = journey.legs.first?.origin {
                    Text(origin)
                }

                ForEach(journey.legs) { leg in
                    HStack {
                        HStack {
                            Text("|").fontWeight(.black)
                            switch leg.mode {
                            case .walking:
                                Image(systemName: "figure.walk")
                            case .bus:
                                Image(systemName: "bus.doubledecker.fill")
                            default:
                                Image(systemName: "tram.fill")
                            }

                            if let lineName = leg.lineName {
                                Text(lineName).fontWeight(.semibold)
                            }
                        }.foregroundColor(leg.color ?? .primary)
                        Text("\(leg.duration) min")
                    }
                    Text(leg.destination)
                }
            }
        }
    }
}

extension Leg {
    var color: Color? {
        switch mode {
        case .bus:
            return .red
        case .overground:
            return .orange
        case .tube:
            return lineName.flatMap(Line.init)?.color
        case .crossrail:
            return .crossrail
        case .walking:
            return nil
        case .nationalRail:
            return nil
        }
    }
}
