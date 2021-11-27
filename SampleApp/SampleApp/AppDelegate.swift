//
// Copyright © 2021 LLC "Globus Media". All rights reserved.
//

import UIKit
import PassengersFramework

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = PassengersAssembly.viewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}

