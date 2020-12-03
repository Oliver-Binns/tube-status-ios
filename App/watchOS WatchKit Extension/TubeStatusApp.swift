//
//  TubeStatusApp.swift
//  watchOS WatchKit Extension
//
//  Created by Laptop 3 on 07/07/2020.
//
import Shared
import SwiftUI

@main
struct TubeStatusApp: App {
    @ObservedObject private var viewModel = StatusViewModel(client: .init())

    var body: some Scene {
        WindowGroup {
            ScrollableContentView(updates: viewModel.status)
        }
    }
}
