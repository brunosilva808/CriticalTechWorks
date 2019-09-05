//
//  LocationDetailsViewController.swift
//  CriticalTechWorks
//
//  Created by Bruno Silva on 02/09/2019.
//

import UIKit

class LocationDetailsViewController: UITableViewController {

    var suggest: Suggestion!
    private let sessionProvider = URLSessionProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        sessionProvider.request(type: Geocoder.self, service: LocationService.details(locationId: suggest.locationID)) { (response) in
            switch response {
            case let .success(locationDetails):
                print(locationDetails)
            case let .failure(error):
                print(error)
            }
        }
    }

}
