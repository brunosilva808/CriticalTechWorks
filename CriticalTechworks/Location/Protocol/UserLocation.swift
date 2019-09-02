//
//  LocationService.swift
//  CriticalTechWorks
//
//  Created by Bruno Silva on 02/09/2019.
//

import Foundation
import CoreLocation

typealias Coordinate = CLLocationCoordinate2D

protocol UserLocation {
    var coordinate: Coordinate { get }
}

extension CLLocation: UserLocation {}
