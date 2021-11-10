//
//  macOSApp.swift
//  macOS
//
//  Created by Oliver Binns on 10/07/2020.
//
import SwiftUI
import UndergroundStatus

@main
struct macOSApp: App {
    @ObservedObject private var viewModel = StatusViewModel(client: .init())

    var body: some Scene {
        WindowGroup {
            ScrollableContentView(updates: viewModel.status)
        }
    }
}