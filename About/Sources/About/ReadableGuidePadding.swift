//
//  ReadableGuidePadding.swift
//  Oliver Binns
//
//  Created by Oliver Binns on 11/10/2020.
import SwiftUI

private struct ReadableGuidePadding: ViewModifier {
    @Environment(\.horizontalSizeClass) var horizontal

    func body(content: Content) -> some View {
        HStack {
            if horizontal == .compact {
                content.padding(.horizontal)
            } else {
                Spacer()
                content
                    .frame(maxWidth: 672)
                    .padding(.horizontal)
                Spacer()
            }
        }
    }
}

public extension View {
    func readableGuidePadding() -> some View {
        modifier(ReadableGuidePadding())
    }
}
