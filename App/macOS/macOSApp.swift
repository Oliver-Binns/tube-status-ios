//
//  macOSApp.swift
//  macOS
//
//  Created by Oliver Binns on 10/07/2020.
//
import SwiftUI
import UndergroundStatus
import JourneyPlanner

@main
struct MACOSApp: App {
    @ObservedObject private var viewModel = StatusViewModel()

    var body: some Scene {
        WindowGroup {
            TabView {
                ScrollView {
                    ContentView(updates: viewModel.status, displayReason: true)
                }.tabItem { Text("Status") }

                ScrollView { JourneyPlanner().padding(16) }
                    .frame(minWidth: 400, minHeight: 400)
                    .tabItem { Text("Journey Planner") }
            }
            .padding(.top, 16)
            .navigationTitle("Tube Status")
        }
    }
}
