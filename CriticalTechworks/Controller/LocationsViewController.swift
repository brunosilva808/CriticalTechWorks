//
//  TableViewController.swift
//  CriticalTechWorks
//
//  Created by Bruno Silva on 30/08/2019.
//

import UIKit

class LocationsViewController: UITableViewController, UISearchResultsUpdating {

    private var geocoder: Geocoder?
    private var searchTask: DispatchWorkItem?
    var locationProvider: UserLocationProvider
    var userLocation: UserLocation?
    private let searchController = UISearchController(searchResultsController: nil)
    private let cellId = "cellId"
    private let sessionProvider = URLSessionProvider()
    private let locationDetailsViewController = LocationDetailsViewController()
    
    init(locationProvider: UserLocationProvider) {
        self.locationProvider = locationProvider
        super.init(style: .plain)
        
        let location = LocationManager()
        location.getCurrentLocation { (location) in
            print(location)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        setupSearchController()
    }
    
    fileprivate func setupTableView() {
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    fileprivate func setupSearchController() {
        self.searchController.searchResultsUpdater = self
        self.searchController.dimsBackgroundDuringPresentation = true
        definesPresentationContext = true
        
        self.tableView.tableHeaderView = self.searchController.searchBar
    }

    fileprivate func getLocationsSuggestions(query: String) {
        sessionProvider.request(type: Geocoder.self, service: LocationService.suggest(query: query)) { [weak self] response in
            switch response {
            case let .success(geocoder):
                self?.geocoder = geocoder
                DispatchQueue.main.async { [weak self] in
                    self?.tableView.reloadData()
                }
            case let .failure(error):
                print(error)
            }
        }
    }
    
    // SearchResultsController

    func updateSearchResults(for searchController: UISearchController) {
        // Cancel previous task if any
        self.searchTask?.cancel()
        
        // Replace previous task with a new one
        guard let query = searchController.searchBar.text, query.trimmingCharacters(in: .whitespaces) != "" else { return }
        let task = DispatchWorkItem { [weak self] in
            self?.getLocationsSuggestions(query: query)
        }
        self.searchTask = task
        
        // Execute task in 0.75 seconds (if not cancelled !)
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.75, execute: task)
    }
    
}

extension LocationsViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchController.searchBar.text?.count == 0 ? 0 : self.geocoder?.suggestions.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = geocoder?.suggestions[indexPath.row].label
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.locationDetailsViewController.suggest = geocoder?.suggestions[indexPath.row]
        self.navigationController?.pushViewController(self.locationDetailsViewController, animated: true)
    }
}

extension LocationsViewController {
    func requestUserLocation() {
        locationProvider.findUserLocation { [weak self] location, error in
            if error == nil {
                self?.userLocation = location
            } else {
                print("User can not be located 😔")
            }
        }
    }
}
