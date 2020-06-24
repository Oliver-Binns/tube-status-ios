//
//  ContentView.swift
//  Shared
//
//  Created by Oliver Binns on 25/06/2020.
//

import SwiftUI

public struct ContentView: View {
    let updates: [LineStatusUpdate]
    let displayReason: Bool
    let height: CGFloat

    public init(updates: [LineStatusUpdate], displayReason: Bool = false, height: CGFloat) {
        self.updates = updates
        self.displayReason = displayReason
        self.height = height
    }

    public var body: some View {
        VStack(spacing: 0) {
            ForEach(updates) { update in
                VStack {
                    LineStatusView(update: update)
                        .padding(0)
                        .frame(minHeight: height / CGFloat(updates.count))
                    if displayReason,
                       let status = update.statuses.first {
                        Text(status.reason)
                            .font(.body)
                            .lineLimit(nil)
                            .padding()
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(updates: [], height: 0)
    }
}
