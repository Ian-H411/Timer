//
//  AppDelegate.swift
//  NapTime
//
//  Created by Ian Hall on 8/6/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge, .sound]) { (success, error) in
            if let error = error{print(error.localizedDescription)}
            if success {
                
            }
        }
        return true
    }

}
