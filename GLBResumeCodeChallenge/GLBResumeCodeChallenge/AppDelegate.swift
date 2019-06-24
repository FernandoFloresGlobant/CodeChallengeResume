//
//  AppDelegate.swift
//  GLBResumeCodeChallenge
//
//  Created by Fernando Flores Gutierrez on 6/20/19.
//  Copyright © 2019 Globant. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        let homeViewController = GLBResumeHomeViewController()
        let navVC = UINavigationController(rootViewController: homeViewController)
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window!.rootViewController = navVC
        self.window!.makeKeyAndVisible()
        return true
    }
}

