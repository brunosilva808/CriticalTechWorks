//
//  Address.swift
//  CriticalTechWorks
//
//  Created by Bruno Silva on 02/09/2019.
//

import UIKit

//// MARK: - Address
//struct Address: Codable {
//    let country, state: String
//    let county, city, district, street: String?
//    let postalCode: String?
//}

// MARK: - Address
struct Address: Codable {
    let country, county: String
    let city, postalCode, state: String?
}

