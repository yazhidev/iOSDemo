//
//  AppDelegate.swift
//  Demo
//
//  Created by zengyazhi on 2019/12/19.
//  Copyright © 2019 zengyazhi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
//    var viewController: UINavigationController?
    var viewController: UIViewController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow.init(frame: UIScreen.main.bounds)
//        let controller: UIViewController?
        viewController = View1()
        //        controller = Charge()
//                viewController = CreateLiveClassInfoCompletionViewController()
//        viewController = CreateLiveClassSucViewController()
        
//        viewController = UINavigationController(rootViewController: viewController!)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = viewController
        return true
    }
    
    
}

