//
//  AppDelegate.swift
//  CounterAppExam
//
//  Created by 민웅킴 on 3/19/24.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      window = UIWindow(frame: UIScreen.main.bounds)
      window?.backgroundColor = .white
//      window?.rootViewController = ViewController()
      window?.makeKeyAndVisible()
      return true
    }
}

