//
//  TubeStatusApp.swift
//  watchOS WatchKit Extension
//
//  Created by Oliver Binns on 07/07/2020.
//
import SwiftUI
import UndergroundStatus

@main
struct TubeStatusApp: App {
    @ObservedObject private var viewModel = StatusViewModel()

    var body: some Scene {
        WindowGroup {
            ScrollableContentView(updates: viewModel.status)
        }
    }
}
