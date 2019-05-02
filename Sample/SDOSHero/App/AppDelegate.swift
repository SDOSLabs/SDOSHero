//
//  AppDelegate.swift
//  SDOSHeroExample
//
//  Created by Antonio Jesús Pallares on 02/05/2019.
//  Copyright © 2019 SDOS. All rights reserved.
//

import Foundation
import UIKit
import SDOSHero

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIStoryboard(name: ExampleSDOSHero, bundle: nil).instantiateInitialViewController()
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        if let vc = vc as? SDOSHeroTabBarController {
            vc.setTabBarAnimationType(.zoomSlide(direction: .left))
        }
        return true
    }

}
