//
//  StationPicker.swift
//  
//
//  Created by Oliver Binns on 03/12/2021.
//
import SwiftUI
import TFLAPI

struct StationPicker: View {
    let title: String
    let stations: [Station]
    @Binding var id: String?

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title).font(.caption2).fontWeight(.semibold)
            Picker(title, selection: $id) {
                Text("Select Station").tag(nil as String?)
                ForEach(stations) {
                    Text($0.name).tag($0.id as String?)
                }
            }
        }
    }
}
