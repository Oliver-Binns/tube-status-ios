//
//  tvOSApp.swift
//  tvOS
//
//  Created by Laptop 3 on 07/07/2020.
//
import Shared
import SwiftUI

@main
struct tvOSApp: App {
    @ObservedObject private var viewModel = StatusViewModel(client: .init())

    var body: some Scene {
        WindowGroup {
            StaticContentView(updates: viewModel.status)
        }
    }
}
