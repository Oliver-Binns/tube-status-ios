//
//  StatusViewModel.swift
//  TFLStatus
//
//  Created by Oliver Binns on 24/06/2020.
//
import Combine
import Foundation
import TFLAPI

public final class StatusViewModel: ObservableObject {
    @Published public var status: [LineStatusUpdate]?
    private let service: StatusService

    public init(service: StatusService = .init()) {
        self.service = service
        service.getStatus { [weak self] status in
            DispatchQueue.main.async {
                self?.status = status
            }
        }
    }
}
