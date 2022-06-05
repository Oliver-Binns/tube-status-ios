//
//  tvOSApp.swift
//  tvOS
//
//  Created by Oliver Binns on 07/07/2020.
//
import SwiftUI
import UndergroundStatus

@main
struct TVOSApp: App {
    @ObservedObject private var viewModel = StatusViewModel()

    var body: some Scene {
        WindowGroup {
            StaticContentView(updates: viewModel.status)
        }
    }
}
