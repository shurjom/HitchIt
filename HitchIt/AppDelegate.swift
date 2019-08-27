//
//  AppDelegate.swift
//  HitchIt
//
//  Created by shurjom on 8/23/19.
//  Copyright © 2019 shurjom. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        let configuration = ParseClientConfiguration {
            $0.applicationId = "eOtpg1wlGhX53uzStm8V0FFmUXBWnlYCC4Os9MYL"
            $0.clientKey = "3FUOUdtgIn5zysDkbORSq9FOyInAgyfBt953Xu8H"
            $0.server = "https://parseapi.back4app.com"
        }
        Parse.initialize(with: configuration)
        saveInstallationObject()
        return true
    }
    
    func saveInstallationObject(){
            if let installation = PFInstallation.current(){
                installation.saveInBackground {
                    (success: Bool, error: Error?) in
                    if (success) {
                        print("App successfully connected to HitchIt Server!")
                    } else {
                        if let myError = error{
                            print(myError.localizedDescription)
                        }else{
                            print("Uknown error")
                        }
                    }
                }
            }
    }
    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}

