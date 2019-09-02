//
//  UserLocationMock.swift
//  CriticalTechWorks
//
//  Created by Bruno Silva on 02/09/2019.
//

import UIKit

struct UserLocationMock: UserLocation {
    var coordinate: Coordinate {
        return Coordinate(latitude: 51.509865, longitude: -0.118092)
    }
}
