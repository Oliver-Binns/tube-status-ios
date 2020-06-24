//
//  TubeStatusApp.swift
//  TubeStatus
//
//  Created by Oliver Binns on 24/06/2020.
//

import Shared
import SwiftUI

@main
struct TubeStatusApp: App {
    @ObservedObject private var viewModel = StatusViewModel(client: .init())

    var body: some Scene {
        WindowGroup {
            GeometryReader { metrics in
                ScrollView(.vertical) {
                    ContentView(updates: viewModel.status, displayReason: true, height: metrics.size.height)
                }
            }
        }
    }
}
