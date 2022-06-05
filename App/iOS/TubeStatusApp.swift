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
                .navigationViewStyle(.stack)

                NavigationView {
                    JourneyPlanner().navigationTitle("Journey Planner")
                }.tabItem {
                    Image(systemName: "arrow.triangle.turn.up.right.diamond.fill")
                    Text("Journey Planner")
                }
                .navigationViewStyle(.stack)
            }
        }
    }
}
