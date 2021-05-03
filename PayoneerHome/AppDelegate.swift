//
//  AppDelegate.swift
//  PayoneerHome
//
//  Created by UNION on 02/05/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        
        //Display Payoneer Payment Methods list ViewController
        window = UIWindow()
        window?.makeKeyAndVisible()
        let paymentListVC = UINavigationController(rootViewController: PaymentListVC())
        window?.rootViewController = paymentListVC
      
        return true

    }




}

