//
//  DetailLineStatusView.swift
//  Shared
//
//  Created by Oliver Binns on 25/06/2020.
//

import SwiftUI
import WidgetKit

public struct SingleLineStatusView: View {
    let update: LineStatusUpdate
    @Environment(\.widgetFamily) var family

    public init(update: LineStatusUpdate) {
        self.update = update
    }

    var isSmall: Bool {
        family == .systemSmall
    }

    public var body: some View {
        GeometryReader { metrics in
            VStack(spacing: isSmall ? 16 : 8) {
                if isSmall,
                   let status = update.statuses.first {
                    Image(systemName: status.type.iconName)
                        .foregroundColor(status.type.color)
                        .font(.title3)
                }
                Text(update.line.rawValue)
                    .foregroundColor(.white)
                    .font(family == .systemSmall ? .title2 : .headline)
                    .fontWeight(.black)
                if let status = update.statuses.first {
                    HStack {
                        if !isSmall {
                            Image(systemName: status.type.iconName)
                                .foregroundColor(status.type.color)
                        }
                        Text(status.type.rawValue)
                            .foregroundColor(.white)
                            .fontWeight(.semibold)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    if family == .systemMedium {
                        Text(status.reason)
                            .foregroundColor(.white)
                            .font(.footnote)
                            .multilineTextAlignment(.center)
                            .lineLimit(4)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                Spacer()
            }
            .padding(.vertical, isSmall ? 16: 8)
            .padding(.horizontal, 8)
            .frame(width: metrics.size.width)
            .background(update.line.color)
        }
    }
}

struct DetailLineStatusView_Previews: PreviewProvider {
    static var previews: some View {
        SingleLineStatusView(update: LineStatusUpdate(line: .bakerloo))
    }
}
