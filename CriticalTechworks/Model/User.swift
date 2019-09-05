//
//  UserLocation.swift
//  CriticalTechWorks
//
//  Created by Bruno Silva on 02/09/2019.
//

import UIKit

class User: UserLocationProvider {
    
    var locationBlockLocationValue: UserLocation?
    var locationBlockErrorValue: UserLocationError?
    
    func findUserLocation(then: @escaping UserLocationCompletionBlock) {
        then(locationBlockLocationValue, locationBlockErrorValue)
    }

}
