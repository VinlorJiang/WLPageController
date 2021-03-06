//
//  AppDelegate.m
//  WLPageController
//
//  Created by dinpay on 2017/6/9.
//  Copyright © 2017年 com.vinlor. All rights reserved.
//

#import "AppDelegate.h"
#import "FeaturedViewController.h"
#import "ContactsViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

// jr

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    
    FeaturedViewController *feaVC = [[FeaturedViewController alloc] init];
    UINavigationController *feaNav = [[UINavigationController alloc] initWithRootViewController:feaVC];
    feaNav.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:1];
    
    ContactsViewController *conVC = [[ContactsViewController alloc] init];
    UINavigationController *conNav = [[UINavigationController alloc] initWithRootViewController:conVC];
    conNav.tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:2];
    conVC.navigationController.title = @"he";
    
    UITabBarController *tabVC = [[UITabBarController alloc] init];
    [tabVC setViewControllers:[NSMutableArray arrayWithObjects:feaNav, conNav, nil]];

    
    self.window.rootViewController = tabVC;
    [self.window makeKeyAndVisible];
    
    
//    [[UINavigationBar appearance] setBarTintColor:[UIColor orangeColor]];
    
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
