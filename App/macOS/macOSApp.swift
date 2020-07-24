//
//  macOSApp.swift
//  macOS
//
//  Created by Laptop 3 on 10/07/2020.
//
import Shared
import SwiftUI

@main
struct macOSApp: App {
    @ObservedObject private var viewModel = StatusViewModel(client: .init())

    var body: some Scene {
        WindowGroup {
            ScrollableContentView(updates: viewModel.status)
        }
    }
}
