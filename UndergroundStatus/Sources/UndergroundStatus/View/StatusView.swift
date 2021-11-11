//
//  StatusView.swift
//  Shared
//
//  Created by Oliver Binns on 25/06/2020.
//
import BaseUI
import SwiftUI
import TFLAPI

struct StatusView: View {
    let status: StatusUpdate

    init(status: StatusUpdate) {
        self.status = status
    }

    public var body: some View {
        HStack(spacing: 4) {
            Image(systemName: status.type.iconName)
                .foregroundColor(status.type.color)
                .accessibility(hidden: true)
            Text(status.type.rawValue)
                .foregroundColor(status.type.color)
                .font(.subheadline)
        }
        .padding(.vertical, 2)
        .padding(.horizontal, 4)
        .background(Color.background.opacity(0.9))
        .cornerRadius(4)
        .padding(.horizontal, 8)
        .padding(.vertical, 4)
    }
}

struct StatusView_Previews: PreviewProvider {
    static var previews: some View {
        StatusView(status: StatusUpdate(id: 0,
                                        type: .goodService,
                                        reason: "Good Service"))
    }
}
