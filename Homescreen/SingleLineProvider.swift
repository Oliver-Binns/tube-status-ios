//
//  SingleLineProvider.swift
//  TubeStatus
//
//  Created by Oliver Binns on 25/06/2020.
//

import Foundation
import Shared
import WidgetKit
import SwiftUI

struct SingleLineProvider: IntentTimelineProvider {
    typealias Intent = LineSelectionIntent
    public typealias Entry = SimpleEntry

    func line(for configuration: LineSelectionIntent) -> Line {
        switch configuration.line {
        case .circle:
            return .circle
        case .district:
            return .district
        case .hammersmith:
            return .hammersmith
        case .jubilee:
            return .jubilee
        case .metropolitan:
            return .metropolitan
        case .northern:
            return .northern
        case .piccadilly:
            return .piccadilly
        case .victoria:
            return .victoria
        case .waterloo:
            return .waterloo
        default: return .bakerloo
        }
    }

    public func snapshot(for configuration: LineSelectionIntent,
                         with context: Context,
                         completion: @escaping (SimpleEntry) -> ()) {
        let line = self.line(for: configuration)
        StatusService.getStatus(client: NetworkClient(), for: line) { updates in
            let entry = SimpleEntry(date: Date(), line: line, updates: updates)
            completion(entry)
        }
    }

    public func timeline(for configuration: LineSelectionIntent,
                         with context: Context,
                         completion: @escaping (Timeline<Entry>) -> ()) {
        let line = self.line(for: configuration)
        StatusService.getStatus(client: NetworkClient(), for: line) { updates in
            let entry = SimpleEntry(date: Date(), line: line, updates: updates)
            // Refresh the data every two minutes:
            let expiryDate = Calendar.current.date(byAdding: .minute, value: 2, to: Date()) ?? Date()
            let timeline = Timeline(entries: [entry], policy: .after(expiryDate))
            completion(timeline)
        }
    }
}

struct SingleLinePlaceholderView : View {
    var body: some View {
        SingleLineStatusView(update: LineStatusUpdate(line: .bakerloo))
    }
}

struct SingleLineWidget: Widget {
    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: "Single Line",
                            intent: LineSelectionIntent.self,
                            provider: SingleLineProvider(),
                            placeholder: SingleLinePlaceholderView()) { entry in
            ZStack {
                if let update = entry.updates.first {
                    SingleLineStatusView(update: update)
                } else {
                    SingleLinePlaceholderView()
                }
            }
        }
            .configurationDisplayName("Line Status")
            .description("See the status for a specific London Underground line")
            .supportedFamilies([.systemSmall, .systemMedium])
    }
}
