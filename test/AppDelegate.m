//
//  AppDelegate.m
//  test
//
//  Created by je_ffy on 16/3/25.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "AppDelegate.h"
///////////////////
#import <JSPatchPlatform/JSPatch.h>
#import "CCLogSystem.h"

NSString *const JSAppKey = @"6741162070b24760";

#import "JFNavigationViewController.h"
#import "JFTabBarViewController.h"
#import "JFNativeTabBarViewController.h"

#define Native_Root  0

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [CCLogSystem setupDefaultLogConfigure];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [CCLogSystem setupDefaultLogConfigure];

    // Override point for customization after application launch.
    [self configeJSPatch];
    
    
    [self prepareRootViewcontroller];
    return YES;
}

//配置JSPatch
- (void)configeJSPatch {
    if (/* DISABLES CODE */ (0)) {
        //测试
        [JSPatch setupCallback:^(JPCallbackType type, NSDictionary *data, NSError *error) {
            if (type == JPCallbackTypeJSException) {
                NSAssert(NO, data[@"msg"]);
            }
        }];
        [JSPatch testScriptInBundle];
        [JSPatch showDebugView];
    }else {
        [JSPatch startWithAppKey:JSAppKey];
        [JSPatch setupRSAPublicKey:@"-----BEGIN PUBLIC KEY-----\nMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCwavPkJDp7WqRcouNyU7qnReDO\nqSZqLi4Yss3qi1UwR1Rn8a4YuUG9AyBlaCw+eBP9y6JPi+O8p9jFfr9EqDonLBNX\nhXb2haJI9VqnC5dkHSYw4Uov6yhHHb3buygcUhreC32rb+2KKy3wYxxhU6sJpB3W\ndvHKDKfIqWgaemYFNwIDAQAB\n-----END PUBLIC KEY-----"];
        [JSPatch sync];
    }
}


- (UIWindow *)window {
    if (!_window) {
        _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        _window.backgroundColor = [UIColor whiteColor];
    }
    
    return _window;
}

- (void)prepareRootViewcontroller {
    
    if (Native_Root) {
        JFNativeTabBarViewController *rootTabBarViewController = [[JFNativeTabBarViewController alloc] init];
        
        self.window.rootViewController = rootTabBarViewController;
    }else {
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
        //由storyboard根据myView的storyBoardID来获取我们要切换的视图
        JFTabBarViewController *rootTabBarViewController = [story instantiateViewControllerWithIdentifier:@"JFTabBarViewController"];
        
        //由navigationController推向我们要推向的view
        self.window.rootViewController = rootTabBarViewController;
        

    }
    
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

- (BOOL)application:(UIApplication *)application continueUserActivity:(NSUserActivity *)userActivity restorationHandler:(void(^)(NSArray * __nullable restorableObjects))restorationHandler {
    if ([userActivity.activityType isEqualToString:NSUserActivityTypeBrowsingWeb]) {
        NSURL *webUrl = userActivity.webpageURL;
        if ([webUrl.host isEqualToString:@"sslpre.shangpin.com"]) {
            NSLog(@"host = %@",webUrl.host);
            //do something
        } else {
            
        }
    }
    
    return YES;
}

@end
