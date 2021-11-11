//
//  SafariButton.swift
//  Oliver Binns
//
//  Created by Oliver Binns on 28/10/2020.
//
import SwiftUI

struct SafariButton<Label: View>: View {
    let url: URL
    let label: Label
    @State private var shouldDisplayLink: Bool = false

    init(url: URL, @ViewBuilder label: () -> Label) {
        self.url = url
        self.label = label()
    }

    var body: some View {
        Button {
            shouldDisplayLink = true
        } label: {
            label
        }
        .sheet(isPresented: $shouldDisplayLink) {
            SafariView(url: url)
        }
    }
}
