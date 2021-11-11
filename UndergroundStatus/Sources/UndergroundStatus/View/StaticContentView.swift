//
//  FixedHeightContentView.swift
//  Shared
//
//  Created by Oliver Binns on 11/07/2020.
//
import SwiftUI
import TFLAPI

public struct StaticContentView: View {
    private let updates: [LineStatusUpdate]?

    public init(updates: [LineStatusUpdate]?) {
        self.updates = updates
    }

    public var body: some View {
        GeometryReader { metrics in
            ContentView(updates: updates)
                .frame(width: metrics.size.width,
                       height: metrics.size.height)
        }
    }
}

struct FixedHeightContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(updates: [])
    }
}
