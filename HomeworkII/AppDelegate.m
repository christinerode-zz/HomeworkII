//
//  AppDelegate.m
//  HomeworkII
//
//  Created by Christine Røde on 2/15/14.
//  Copyright (c) 2014 Christine Røde. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "PostViewController.h"
#import "NotificationViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    
    // Define ViewControllers
    MainViewController *vc = [[MainViewController alloc] init];
    NotificationViewController *notifvc = [[NotificationViewController alloc] init];
    PostViewController *postvc = [[PostViewController alloc] init];

    // Define NavControllers
    UINavigationController *feedNavigationController = [[UINavigationController alloc] initWithRootViewController:vc];
    UINavigationController *notifNavigationController = [[UINavigationController alloc] initWithRootViewController:notifvc];
    
    [viewControllers addObject:feedNavigationController];
    [viewControllers addObject:notifNavigationController];
    
    // create the tab controller and add the view controllers
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    [tabBarController setViewControllers:viewControllers];
    
    // Push post in Feed View
   [feedNavigationController pushViewController:postvc animated:NO];
    
    self.window.rootViewController = tabBarController;
    
    // Set Feed NavBar Style
    feedNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:70.0/255.0 green:100.0/255.0 blue:158.0/255.0 alpha:1];
    [feedNavigationController.navigationBar setTranslucent:YES];
    [feedNavigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
    [feedNavigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    // Set Notif NavBar Style
    notifNavigationController.navigationBar.barTintColor = [UIColor colorWithRed:70.0/255.0 green:100.0/255.0 blue:158.0/255.0 alpha:1];
    [notifNavigationController.navigationBar setTranslucent:YES];
    [notifNavigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor whiteColor] forKey:NSForegroundColorAttributeName]];
    [notifNavigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
    // More appearance stuff
    [[UIBarButtonItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName,nil] forState:UIControlStateNormal];
    
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    // Tab bar icons
    
    notifNavigationController.tabBarItem.title = @"Notifications";
    notifNavigationController.tabBarItem.image = [UIImage imageNamed:@"tab_notif"];

    feedNavigationController.tabBarItem.title = @"Feed";
    feedNavigationController.tabBarItem.image = [UIImage imageNamed:@"tab_feed"];
    
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
