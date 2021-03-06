//
//  AppDelegate.swift
//  CnnRssFeed
//
//  Created by Pavel N on 11/26/19.
//  Copyright © 2019 Pavel N. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let firstModule = ChannelsBuilder.build()
        window = firstModule.attachToWindow(withNavigationController: false)        
        return true
    }
}

