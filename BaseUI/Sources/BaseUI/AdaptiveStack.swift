//
//  AdaptiveStack.swift
//  Shared
//
//  Created by Oliver Binns on 11/07/2020.
//
import SwiftUI

public struct AdaptiveStack<Content: View>: View {
    @Environment(\.sizeCategory) private var sizeCategory

    private var shouldDisplayVertically: Bool {
        #if os(iOS)
        return sizeCategory >= .accessibilityMedium
        #elseif os(watchOS)
        return true
        #else
        return false
        #endif
    }

    let content: () -> Content

    public init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    public var body: some View {
        Group {
            if shouldDisplayVertically {
                VStack(spacing: 0, content: content)
            } else {
                HStack(spacing: 0, content: content)
            }
        }
    }
}
