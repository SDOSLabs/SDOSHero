//
//  AppDelegate.m
//  BaseProject
//
//  Created by Rafael Fernandez Alvarez on 16/11/15.
//  Copyright © 2015 SDOS. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    UIViewController *vc = [[UIStoryboard storyboardWithName:ExampleSDOSHero bundle:nil] instantiateInitialViewController];
    
    self.window.rootViewController = vc;
    [self.window makeKeyAndVisible];
    
    if ([vc isKindOfClass:[SDOSHeroTabBarController class]]) {
        [((SDOSHeroTabBarController *)vc) setTabBarSDOSHeroAnimationType:SDOSHeroAnimationTypeZoomSlideLeft];
    }
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark Google Analytics Methods

- (void) configureAnalytics {
// Create tracker instance.
//    [[GAI sharedInstance] setDefaultTracker:[[GAI sharedInstance] trackerWithTrackingId:KZ_googleAnalyticsKey]];
//    [[GAI sharedInstance].defaultTracker send:[[[GAIDictionaryBuilder createEventWithCategory:@"UX" action:@"appstart" label:nil value:nil] set:@"start" forKey:kGAISessionControl] build]];
//    [GAI sharedInstance].trackUncaughtExceptions = YES;  // report uncaught exceptions
//Modo depuración. Borrar o comentar antes de subir a pro
//    [GAI sharedInstance].logger.logLevel = kGAILogLevelVerbose;
}

@end
