//
//  TableViewController.swift
//  CriticalTechWorks
//
//  Created by Bruno Silva on 30/08/2019.
//

import UIKit

class TableViewController: UITableViewController, UISearchResultsUpdating {

    private var geocoder: Geocoder?
    private let searchController = UISearchController(searchResultsController: nil)
    private let cellId = "cellId"
    private let sessionProvider = URLSessionProvider()
    
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

    fileprivate func getPosts(query: String) {
        sessionProvider.request(type: Geocoder.self, service: SuggestService.suggest(query: query)) { [weak self] response in
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
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.reload(_:)), object: searchController.searchBar)
        perform(#selector(self.reload(_:)), with: searchController.searchBar, afterDelay: 0.75)
    }
    
    @objc func reload(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, query.trimmingCharacters(in: .whitespaces) != "" else {
            self.tableView.reloadData()
            return
        }
        
        getPosts(query: query)
    }
    
}

extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.searchController.searchBar.text?.count == 0 ? 0 : self.geocoder?.suggestions.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = geocoder?.suggestions[indexPath.row].label
        return cell
    }
}
