//
//  URL.swift
//  Oliver Binns
//
//  Created by Oliver Binns on 28/10/2020.
//
import Foundation

extension URL {
    init(staticString: StaticString) {
        guard let url = URL (string: "\(staticString)") else {
            preconditionFailure ("Invalid static URL string: \(staticString) ")
        }
        self = url
    }

    static let businessCard = URL(staticString: "https://www.oliverbinns.co.uk/businesscard.pkpass")
    static let twitter = URL(staticString: "https://www.twitter.com/oliver_binns")
    static let linkedIn = URL(staticString: "https://www.linkedin.com/in/obinns")
    static let gitHub = URL(staticString: "https://github.com/Oliver-Binns")
    static let profileImage = URL(staticString: "https://www.oliverbinns.co.uk/img/profile.jpg")
}
