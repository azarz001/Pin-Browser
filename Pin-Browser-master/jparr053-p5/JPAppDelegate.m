//
//  JPAppDelegate.m
//  jparr053-p5
//
// PROGRAMMER: Jonathan Parrilla

// PATHER ID: 3767284

// CLASS: COP4655 MW 5:00

// INSTRUCTOR: Steven Luis ECS 282

// ASSIGMENT: #5 Pin Browser Program

// DUE: Monday 03/10/2014
//  Created by Jonathan Parrilla on 3/6/14.
//  Copyright (c) 2014 Jonathan Parrilla. All rights reserved.
//

#import "JPAppDelegate.h"

#import "JPPinEntryViewController.h"

#import "JPBrowserViewController.h"

#import "JPEditViewController.h"


@implementation JPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    // Override point for customization after application launch.
    
    
    // Pin Entry View
    UIViewController *entryView = [[JPPinEntryViewController alloc]
                                   initWithNibName:@"JPEntryViewController" bundle:nil];
    
    
    // Browser View
    UIViewController *browserView = [[JPBrowserViewController alloc]
                                     initWithNibName:@"JPBrowserViewController" bundle:nil];
    
    
    // Edit View
    UIViewController *editView = [[JPEditViewController alloc]
                                  initWithNibName:@"JPEditViewController" bundle:nil];
    
    
    self.tabBarController = [[UITabBarController alloc] init];
    
    
    //This is where we assign our views to our tab controller.
    self.tabBarController.viewControllers = @[entryView, browserView, editView];
    
    //We make our tab controller our root view controller (default view).
    self.window.rootViewController = self.tabBarController;
    
    
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

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
