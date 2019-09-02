//
//  Suggestion.swift
//  CriticalTechWorks
//
//  Created by Bruno Silva on 02/09/2019.
//

import UIKit

// MARK: - Suggestion
struct Suggestion: Codable {
    let label, language, countryCode, locationID: String
    let address: Address
    let matchLevel: String
    
    enum CodingKeys: String, CodingKey {
        case label, language, countryCode
        case locationID = "locationId"
        case address, matchLevel
    }
}
