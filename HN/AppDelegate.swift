//
//  AppDelegate.swift
//  HN
//
//  Created by Ben Gordon on 9/8/14.
//  Copyright (c) 2014 bennyguitar. All rights reserved.
//

import UIKit
import Accelerate

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
                            
    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Start Loading Data
        HNManager.sharedManager().startSession()
        
        // Create VCs
        var postsVC = HNPostsViewController(nibName: BGUtils.className(HNPostsViewController.self), bundle: nil, postType: PostFilterType.Top)
        var postsNavVC = UINavigationController(rootViewController: postsVC)
        var navVC = HNNavigationViewController(nibName: BGUtils.className(HNNavigationViewController.self), bundle: nil)
        
        // Create MMDrawerController
        var drawer = MMDrawerController(centerViewController: postsNavVC, rightDrawerViewController: navVC)
        drawer.setMaximumRightDrawerWidth(258, animated: false, completion: nil)
        drawer.openDrawerGestureModeMask = MMOpenDrawerGestureMode.All
        drawer.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.All
        drawer.centerHiddenInteractionMode = MMDrawerOpenCenterInteractionMode.None
        
        
        // Launch
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.rootViewController = drawer
        window!.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
        HNManager.sharedManager().downloadAndSetConfiguration();
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}
