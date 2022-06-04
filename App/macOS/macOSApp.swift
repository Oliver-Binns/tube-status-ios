//
//  macOSApp.swift
//  macOS
//
//  Created by Oliver Binns on 10/07/2020.
//
import SwiftUI
import UndergroundStatus

@main
struct MACOSApp: App {
    @ObservedObject private var viewModel = StatusViewModel()

    var body: some Scene {
        WindowGroup {
            ScrollableContentView(updates: viewModel.status)
        }
    }
}
