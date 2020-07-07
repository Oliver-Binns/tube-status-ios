//
//  Homescreen.swift
//  Homescreen
//
//  Created by Oliver Binns on 24/06/2020.
//

import Foundation
import Shared
import WidgetKit
import SwiftUI

struct AllLinesProvider: TimelineProvider {
    public func snapshot(with context: Context, completion: @escaping (SimpleEntry) -> ()) {
        StatusService.getStatus(client: NetworkClient()) { updates in
            let entry = SimpleEntry(date: Date(), line: nil, updates: updates)
            completion(entry)
        }
    }

    public func timeline(with context: Context,
                         completion: @escaping (Timeline<Entry>) -> ()) {
        StatusService.getStatus(client: NetworkClient()) { updates in
            let entry = SimpleEntry(date: Date(), line: nil, updates: updates)
            // Refresh the data every two minutes:
            let expiryDate = Calendar.current.date(byAdding: .minute, value: 2, to: Date()) ?? Date()
            let timeline = Timeline(entries: [entry], policy: .after(expiryDate))
            completion(timeline)
        }
    }
}

struct SimpleEntry: TimelineEntry {
    let date: Date
    let line: Line?
    let updates: [LineStatusUpdate]
}

struct AllLinesPlaceholderView: View {
    var body: some View {
        GeometryReader { metrics in
            ContentView(updates: Line.allCases.map { line in
                LineStatusUpdate(line: line)
            }, height: metrics.size.height)
        }
    }
}

struct AllLinesWidget: Widget {
    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: "All Lines",
                            provider: AllLinesProvider(),
                            placeholder: AllLinesPlaceholderView()) { entry in
            GeometryReader { metrics in
                ContentView(updates: entry.updates, height: metrics.size.height)
            }
        }
        .configurationDisplayName("Tube Status")
        .description("See the status board for all London Underground lines")
        .supportedFamilies([.systemLarge])
    }
}
