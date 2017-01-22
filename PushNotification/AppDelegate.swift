//
//  AppDelegate.swift
//  PushNotification
//
//  Created by Kentarou on 2016/11/27.
//  Copyright © 2016年 Kentarou. All rights reserved.
//

import UIKit
import LogPush
import HockeySDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        LogPush.initApplicationId("63013009759662080",
                                  secretKey: "8xp0op2LPDVcnIq4yIadqu8y5xEaClMz", launchOptions: launchOptions)
        LogPush.setDeviceTags()
        LogPush.requestDeviceToken()
        
        
        BITHockeyManager.shared().configure(withIdentifier: "c088275b7e2c48759169ce30fe6f9da9")
        BITHockeyManager.shared().start()
        BITHockeyManager.shared().authenticator.authenticateInstallation()

        
        return true
    }
    
    func application(_ application: UIApplication,
                     didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        #if DEBUG
            let env = LPDevelopment
        #else
            let env = LPProduction
        #endif
        LogPush.application(application,
                            didRegisterForRemoteNotificationsWithDeviceToken: deviceToken, with: env)
    }
    
    func application(_ application: UIApplication,
                     didFailToRegisterForRemoteNotificationsWithError error: Error) {
        LogPush.application(application, didFailToRegisterForRemoteNotificationsWithError: error)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
    
        print("application:didReceiveRemoteNotification: " + userInfo.description);
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    
        LogPush.application(application, didReceiveRemoteNotification: userInfo,
                            fetchCompletionHandler: completionHandler)
    }
}

