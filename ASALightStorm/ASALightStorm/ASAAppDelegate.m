//
//  ASAAppDelegate.m
//  ASALightStorm
//
//  Created by AndrewShmig on 9/9/13.
//  Copyright (c) 2013 AndrewShmig. All rights reserved.
//

#import "ASAAppDelegate.h"

#import "ASAViewController.h"
#import "ASALightStorm.h"
#import "ASALightStormProfile.h"

@implementation ASAAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.viewController = [[ASAViewController alloc] initWithNibName:@"ASAViewController" bundle:nil];
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    NSLog(@"%s", __FUNCTION__);
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    NSLog(@"%s", __FUNCTION__);
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    NSLog(@"%s", __FUNCTION__);
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    NSLog(@"%s", __FUNCTION__);
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    NSLog(@"%s", __FUNCTION__);
    
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [[ASALightStorm sharedStorm] saveStormManagedObjectContext];
}

@end