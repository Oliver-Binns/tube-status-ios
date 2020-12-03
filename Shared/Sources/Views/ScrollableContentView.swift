//
//  ScrollableContentView.swift
//  Shared
//
//  Created by Laptop 3 on 11/07/2020.
//
import SwiftUI

public struct ScrollableContentView: View {
    private let updates: [LineStatusUpdate]

    public init(updates: [LineStatusUpdate]) {
        self.updates = updates
    }

    public var body: some View {
        GeometryReader { metrics in
            ScrollView(.vertical) {
                ContentView(updates: updates, displayReason: true)
            }
        }
    }
}

struct ScrollableContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(updates: [])
    }
}
