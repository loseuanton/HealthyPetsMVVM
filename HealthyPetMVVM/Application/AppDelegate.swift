//
//  AppDelegate.swift
//  HealthyPetMVVM
//
//  Created by ANTON LOSEU on 5.08.22.
//

import UIKit
import GoogleMaps
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tabBarControllers: MyDogFlowCoordinator?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
       // FirebaseApp.configure()
        GMSServices.provideAPIKey("AIzaSyB1ulq37okR2bEyNUZxPHeZz04hdGaFQwI")
        if UserDefaults.standard.hasOnboarded {
            initionalCoordinator()
        } else {
            
            onboardingFlow()
        }
        
        
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
    func onboardingFlow() {
        window = UIWindow()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var vc: UIViewController
        vc = storyboard.instantiateViewController(withIdentifier: "OnboardingViewController")
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }


}
extension UserDefaults {
    private enum UserDefaultsKeys: String {
        case hasOnboarded
    }
    var hasOnboarded: Bool {
        get {
            bool(forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
        set {
            setValue(newValue, forKey: UserDefaultsKeys.hasOnboarded.rawValue)
        }
    }
}

