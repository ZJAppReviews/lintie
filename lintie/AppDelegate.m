//
//  AppDelegate.m
//  lintie
//
//  Created by Away on 2018/5/20.
//  Copyright © 2018 Away. All rights reserved.
//

#import "AppDelegate.h"
#import "ArtistViewController.h"
#import "ArchViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {


    __auto_type artistVC = [[ArtistViewController alloc] init];
    artistVC.title = @"名家";
    __auto_type navigationController1 = [[UINavigationController alloc] initWithRootViewController:artistVC];
    navigationController1.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"名家" image:nil selectedImage:nil];



    __auto_type archVC = [[ArchViewController alloc] init];
    artistVC.title = @"间架";
    __auto_type navigationController2 = [[UINavigationController alloc] initWithRootViewController:archVC];
    navigationController2.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"间架" image:nil selectedImage:nil];

    UITabBarController *tabBarController = [[UITabBarController alloc] init];

    tabBarController.viewControllers = @[navigationController1, navigationController2];


    self.window.rootViewController = tabBarController;

    [self.window makeKeyAndVisible];

//    for(NSString *fontfamilyname in [UIFont familyNames])
//    {
//        NSLog(@"family:'%@'",fontfamilyname);
//        for(NSString *fontName in [UIFont fontNamesForFamilyName:fontfamilyname])
//        {
//            NSLog(@"\tfont:'%@'",fontName);
//        }
//        NSLog(@"-------------");
//    }

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
