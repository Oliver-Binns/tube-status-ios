//
//  Homescreen.swift
//  Homescreen
//
//  Created by Oliver Binns on 24/06/2020.
//
import Foundation
import SwiftUI
import TFLAPI
import UndergroundStatus
import WidgetKit

struct AllLinesProvider: TimelineProvider {
    func placeholder(in context: Context) -> SimpleEntry {
        SimpleEntry(date: Date(), line: nil, updates: Line.allCases.map { line in
            LineStatusUpdate(line: line)
        })
    }

    public func getSnapshot(in context: Context,
                            completion: @escaping (SimpleEntry) -> ()) {
        StatusService().getStatus { updates in
            completion(placeholder(in: context))
        }
    }

    public func getTimeline(in context: Context,
                            completion: @escaping (Timeline<Entry>) -> ()) {
        StatusService().getStatus { updates in
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
struct AllLinesWidget: Widget {
    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: "All Lines",
                            provider: AllLinesProvider()) { entry in
            StaticContentView(updates: entry.updates)
        }
        .configurationDisplayName("Tube Status")
        .description("See the status board for all London Underground lines")
        .supportedFamilies([.systemLarge])
    }
}
