//
//  LocationProvider.swift
//  CriticalTechWorks
//
//  Created by Bruno Silva on 02/09/2019.
//

import Foundation
import CoreLocation

protocol LocationProvider {
    var isUserAuthorized: Bool { get }
    func requestWhenInUseAuthorization()
    func requestLocation()
}

extension CLLocationManager: LocationProvider {
    var isUserAuthorized: Bool {
        return CLLocationManager.authorizationStatus() == .authorizedWhenInUse
    }
}
