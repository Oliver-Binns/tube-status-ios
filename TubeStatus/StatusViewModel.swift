//
//  StatusViewModel.swift
//  TFLStatus
//
//  Created by Oliver Binns on 24/06/2020.
//

import Combine
import Foundation
import Shared

final class StatusViewModel: ObservableObject {
    @Published var status: [LineStatusUpdate] = []

    init(client: NetworkClient) {
        StatusService.getStatus(client: client) { [weak self] status in
            DispatchQueue.main.async {
                self?.status = status
            }
        }
    }
}
