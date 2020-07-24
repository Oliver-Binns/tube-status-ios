//
//  ContentView.swift
//  Shared
//
//  Created by Oliver Binns on 25/06/2020.
//

import SwiftUI

struct ContentView: View {
    let updates: [LineStatusUpdate]
    let displayReason: Bool

    public init(updates: [LineStatusUpdate], displayReason: Bool = false) {
        self.updates = updates
        self.displayReason = displayReason
    }

    var body: some View {
        VStack(spacing: 0) {
            ForEach(updates) { update in
                VStack {
                    LineStatusView(update: update)
                        .padding(0)
                    if displayReason,
                       let status = update.statuses.first {
                        Text(status.reason.trimmingCharacters(in: .whitespacesAndNewlines))
                            .font(.body)
                            .lineLimit(nil)
                            .padding()
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(updates: [])
    }
}
