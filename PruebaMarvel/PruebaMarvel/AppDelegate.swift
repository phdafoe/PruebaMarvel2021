//
//  AppDelegate.swift
//  PruebaMarvel
//
//  Created by Andres Felipe Ocampo Eljaiek
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let appAssembly = AppAssembly()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        if let windowDes = window {
            appAssembly.applicationShowInitVC(windowDes)
        }
        return true
    }

}

