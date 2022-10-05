//
//  AppDelegate.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 5.08.22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tabBarControllers: MyDogFlowCoordinator?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        initionalCoordinator()
        return true
    }

    func initionalCoordinator() {
        
        let tabBarController = UITabBarController()
        
        
        window = UIWindow()
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        window?.overrideUserInterfaceStyle = .light

        
        
        tabBarControllers = MyDogFlowCoordinator(tabBarController: tabBarController)
        tabBarControllers?.start()
    }


}

