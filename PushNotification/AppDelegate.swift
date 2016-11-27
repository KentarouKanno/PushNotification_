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
        // Do some additional configuration if needed here
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
    
    func application(_ application: UIApplication,
                     didReceiveRemoteNotification userInfo: [AnyHashable : Any],
                     fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        LogPush.application(application, didReceiveRemoteNotification: userInfo,
                            fetchCompletionHandler: completionHandler)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

