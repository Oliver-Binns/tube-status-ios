//
//  ContentView.swift
//  Shared
//
//  Created by Oliver Binns on 25/06/2020.
//
import SwiftUI
import TFLAPI

public struct ContentView: View {
    let updates: [LineStatusUpdate]?
    let displayReason: Bool
    
    public init(updates: [LineStatusUpdate]?,
                displayReason: Bool = false) {
        self.updates = updates
        self.displayReason = displayReason
    }
    
    public var body: some View {
        VStack(alignment: .center, spacing: 0) {
            if let updates = updates {
                ForEach(updates) { update in
                    VStack {
                        LineStatusView(update: update)
                            .padding(0)
                        if displayReason,
                           let reason = update.statuses.first?.reason {
                            Text(reason.trimmingCharacters(in: .whitespacesAndNewlines))
                                .font(.subheadline)
                                .lineLimit(nil)
                                .multilineTextAlignment(.leading)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity,
                                       alignment: .topLeading)
                                .padding(.horizontal, 16)
                                .padding(.bottom, 16)
                                .fixedSize(horizontal: false, vertical: true)
                        }
                    }
                    .accessibility(addTraits: [.isStaticText])
                    .accessibility(removeTraits: [.isImage])
                    .accessibilityElement(children: .combine)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(update.line.color)
                }
            } else {
                ProgressView()
            }
        }.frame(maxWidth: .infinity)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(updates: [])
    }
}
