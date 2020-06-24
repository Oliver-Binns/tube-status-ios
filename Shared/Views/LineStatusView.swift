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
        GeometryReader { metrics in
            HStack(spacing: 0) {
                Text(update.line.displayName)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                    .padding(.leading, 16)
                    .padding(.trailing, 8)
                    .padding(.vertical, 4)
                    .frame(width: metrics.size.width * 0.45, alignment: .leading)
                    .frame(minHeight: metrics.size.height)
                    .background(update.line.color)
                if let status = update.statuses.first {
                    StatusView(status: status)
                        .frame(width: metrics.size.width * 0.55, alignment: .leading)
                } else {
                    Text("-")
                }
            }.frame(minHeight: metrics.size.height)
        }
    }
}

struct LineStatusView_Previews: PreviewProvider {
    static var previews: some View {
        LineStatusView(update: LineStatusUpdate(line: .bakerloo))
    }
}
