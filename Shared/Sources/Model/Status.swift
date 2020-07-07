//
//  Status.swift
//  Shared
//
//  Created by Oliver Binns on 25/06/2020.
//

import Foundation

enum Status: String, Decodable {
    case specialService = "Special Service"
    case closed = "Closed"
    case suspended = "Suspended"
    case partSuspended = "Part Suspended"
    case plannedClosure = "Planned Closure"
    case partClosure = "Part Closure"
    case severeDelays = "Severe Delays"
    case reducedService = "Reduced Service"
    case busService = "Bus Service"
    case minorDelays = "Minor Delays"
    case goodService = "Good Service"
    case partClosed = "Part Closed"
    case exitOnly = "Exit Only"
    case noStepFreeAccess = "No Step Free Access"
    case changeOfFrequency = "Change of frequency"
    case diverted = "Diverted"
    case notRunning = "Not Running"
    case issuesReported = "Issues Reported"
    case noIssues = "No Issues"
    case information = "Information"
    case serviceClosed = "Service Closed"
}
