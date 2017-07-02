//
//  AppDelegate.swift
//  xiaoMingBook
//
//  Created by 任茗赫 on 2017/7/2.
//  Copyright © 2017年 任茗赫. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.window = UIWindow(frame: UIScreen.main.bounds);
        let mainTB = mainTBVC();
        mainTB.tabBar.backgroundColor = UIColor.white;
        let bookshelfVC = BSTableVC();    // 书架
        let featured = UIViewController();    // 精选
        let stacks = UIViewController();    // 书库
        let find = UIViewController();    // 发现
        
        let bookshelNav = BSNav(rootViewController: bookshelfVC);
        
        bookshelNav.tabBarItem = UITabBarItem(
            title: "书架",
            image: UIImage(named: "bookshelf.png"),
            selectedImage: UIImage(named: "bookshelf.png")
        );
        featured.tabBarItem = UITabBarItem(
            title: "精选",
            image: UIImage(named: "featured.png"),
            selectedImage: UIImage(named: "featured.png")
        );
        stacks.tabBarItem = UITabBarItem(
            title: "书库",
            image: UIImage(named: "stacks.png"),
            selectedImage: UIImage(named: "stacks.png")
        );
        find.tabBarItem = UITabBarItem(
            title: "发现",
            image: UIImage(named: "find.png"),
            selectedImage: UIImage(named: "find.png")
        );
        
        mainTB.viewControllers = [bookshelNav, featured, stacks, find];
        self.window?.rootViewController = mainTB;
        self.window?.makeKeyAndVisible();
        return true
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

