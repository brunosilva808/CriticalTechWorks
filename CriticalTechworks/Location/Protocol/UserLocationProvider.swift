//
//  UserLocationProvider.swift
//  CriticalTechWorks
//
//  Created by Bruno Silva on 02/09/2019.
//

import Foundation

enum UserLocationError: Error {
    case canNotBeLocated
}

typealias UserLocationCompletionBlock = (UserLocation?, UserLocationError?) -> Void

protocol UserLocationProvider {
    func findUserLocation(then: @escaping UserLocationCompletionBlock)
}
