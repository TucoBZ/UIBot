//
//  AppDelegate.swift
//  UIBot
//
//  Created by TucoBZ on 09/25/2018.
//  Copyright (c) 2018 TucoBZ. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var isUiTestingEnabled: Bool {
        get {
            return ProcessInfo.processInfo.arguments.contains("UI_TEST")
        }
    }
    
    var startViewControllerType: ViewControllerType? {
        get {
            guard let type = ProcessInfo.processInfo.environment["startViewController"] else {return nil}
            return ViewControllerType(rawValue: type)
        }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        setupUITesting()
        
        return true
    }

    func setupUITesting() {
        if isUiTestingEnabled {
            guard let type = startViewControllerType else { return }
            switch type {
            case .buttonLabel:
                let buttonLabelViewController = ButtonLabelViewController(nibName: "ButtonLabelViewController", bundle: nil)
                start(from: buttonLabelViewController)
            default:
                guard let initialViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() else {return}
                start(from: initialViewController)
            }
        }
    }

    private func start(from viewController: UIViewController) {
        window?.rootViewController = viewController
        window?.makeKeyAndVisible()
    }
    
}

