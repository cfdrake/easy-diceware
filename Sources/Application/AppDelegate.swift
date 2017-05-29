//
//  AppDelegate.swift
//  EasyDiceware
//
//  Created by Colin Drake on 5/28/17.
//  Copyright © 2017 Colin Drake. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: Static Properties

    enum NotificationType: String {
        case enteringBackground, leavingBackground
    }

    // MARK: Properties

    var window: UIWindow?

    // MARK: UIApplication

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        NotificationCenter.default.post(name: Notification.Name(NotificationType.enteringBackground.rawValue), object: nil)
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        NotificationCenter.default.post(name: Notification.Name(NotificationType.leavingBackground.rawValue), object: nil)
    }

}
