//
//  AdaptiveStack.swift
//  Shared
//
//  Created by Laptop 3 on 11/07/2020.
//
import SwiftUI

struct AdaptiveStack<Content: View>: View {
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

    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        Group {
            if shouldDisplayVertically {
                VStack(spacing: 0, content: content)
            } else {
                HStack(spacing: 0, content: content)
            }
        }
    }
}
