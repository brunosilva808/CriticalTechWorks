//
//  LocationManager.swift
//  CriticalTechWorks
//
//  Created by Bruno Silva on 05/09/2019.
//

import UIKit
import CoreLocation

class LocationManager: NSObject {

    private let locationManager: CLLocationManager
    private var currentLocationCallback: (((CLLocation)) -> Void)?
    
    init(locationManager: CLLocationManager = CLLocationManager()) {
        self.locationManager = locationManager
        super.init()
        self.locationManager.delegate = self
    }
    
//    func getCurrentLocation() {
//        self.locationManager.requestLocation()
//        self.locationManager.requestWhenInUseAuthorization()
//    }
    
    func getCurrentLocation(completion: @escaping (CLLocation) -> Void) {
        currentLocationCallback = { (location) in
            completion(location)
        }
    }
    
}

extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations:[CLLocation]) {
        guard let location = locations.first else { return }
        self.currentLocationCallback?(location)
        self.currentLocationCallback = nil
        print("The location is: \(location)")
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error: \(error)")
    }
}
