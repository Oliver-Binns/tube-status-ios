//
//  Card.swift
//  Oliver Binns
//
//  Created by Oliver Binns on 28/10/2020.
//
import SwiftUI

struct Card<Content: View>: View {
    let content: Content
    let backgroundColor: Color

    init(backgroundColor: Color = .white,
         @ViewBuilder content: () -> Content) {
        self.backgroundColor = backgroundColor
        self.content = content()
    }

    var body: some View {
        content
        .padding()
        .frame(maxWidth: .infinity)
        .background(backgroundColor)
        .cornerRadius(20)
        .shadow(radius: 10)
    }
}
