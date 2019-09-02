//
//  TableViewController.swift
//  CriticalTechWorks
//
//  Created by Bruno Silva on 30/08/2019.
//

import UIKit

class TableViewController: UITableViewController {

    private let sessionProvider = URLSessionProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPosts()
    }
    
    private func getPosts() {
        sessionProvider.request(type: [Post].self, service: PostService.all) { response in
            switch response {
            case let .success(posts):
                print(posts)
            case let .failure(error):
                print(error)
            }
        }
    }
    
}
