//
//  AppDelegate.swift
//  CriticalTechWorks
//
//  Created by Bruno Silva on 16/11/2018.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow()
        window?.makeKeyAndVisible()
//        window?.rootViewController = UINavigationController(rootViewController: LocationsViewController(locationProvider: <#T##UserLocationProvider#>))
        
        return true
    }

}
