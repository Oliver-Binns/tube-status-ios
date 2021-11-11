//
//  TubeStatusApp.swift
//  TubeStatus
//
//  Created by Oliver Binns on 24/06/2020.
//
import About
import JourneyPlanner
import SwiftUI
import UndergroundStatus

@main
struct TubeStatusApp: App {
    @ObservedObject private var viewModel = StatusViewModel()

    var body: some Scene {
        WindowGroup {
            TabView {
                NavigationView {
                    ScrollableContentView(updates: viewModel.status)
                        .navigationTitle("Tube Status")
                }.tabItem {
                    Image(systemName: "tram")
                    Text("Status")
                }
                NavigationView {
                    ScrollView {
                        JourneyPlanner()
                    }.navigationTitle("Journey Planner")
                }.tabItem {
                    Image(systemName: "arrow.triangle.turn.up.right.diamond.fill")
                    Text("Journey Planner")
                }
                ScrollView {
                    AboutView().readableGuidePadding()
                }
                    .tabItem {
                        Image(systemName: "info.circle")
                        Text("About")
                    }
            }
        }
    }
}
