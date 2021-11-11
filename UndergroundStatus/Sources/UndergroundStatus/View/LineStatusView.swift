//
//  ContentView.swift
//  TFLStatus
//
//  Created by Oliver Binns on 24/06/2020.
//
import BaseUI
import SwiftUI
import TFLAPI

struct LineStatusView: View {
    @Environment(\.sizeCategory) private var sizeCategory

    let update: LineStatusUpdate

    var body: some View {
        AdaptiveStack {
            Text(update.line.displayName)
                .font(.headline)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .lineLimit(0)
                .padding(.leading, 16)
                .padding(.trailing, 8)
                .padding(.vertical, 4)

            if sizeCategory < .accessibilityMedium {
                Spacer()
            }

            if let status = update.statuses.first {
                StatusView(status: status)
                    .lineLimit(0)
                    .fixedSize(horizontal: true, vertical: false)
            } else {
                Text("-")
            }
        }
    }
}
struct LineStatusView_Previews: PreviewProvider {
    static var previews: some View {
        LineStatusView(update: LineStatusUpdate(line: .bakerloo))
    }
}
