//
//  AppDelegate.h
//  test
//
//  Created by je_ffy on 16/3/25.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFNativeTabBarViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, weak, readonly) UITabBarController *rootController;

- (UIViewController *)topViewController ;



@end

