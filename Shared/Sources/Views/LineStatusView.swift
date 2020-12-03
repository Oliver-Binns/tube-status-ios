//
//  ContentView.swift
//  TFLStatus
//
//  Created by Oliver Binns on 24/06/2020.
//
import SwiftUI

struct LineStatusView: View {
    let update: LineStatusUpdate

    var body: some View {
        AdaptiveStack {
            Text(update.line.displayName)
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(.white)
                .lineLimit(0)
                .padding(.leading, 16)
                .padding(.trailing, 8)
                .padding(.vertical, 4)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(update.line.color)
            if let status = update.statuses.first {
                StatusView(status: status)
                    .lineLimit(0)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            } else {
                Text("-")
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    }
}
struct LineStatusView_Previews: PreviewProvider {
    static var previews: some View {
        LineStatusView(update: LineStatusUpdate(line: .bakerloo))
    }
}
