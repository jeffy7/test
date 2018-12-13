//
//  JFMacroHeader.h
//  test
//
//  Created by je_ffy on 2017/3/20.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#ifndef JFMacroHeader_h
#define JFMacroHeader_h

//工程里里面通用的宏
#define FULL_SCREEN_WIDTH   ([UIScreen mainScreen].bounds.size.width)
#define FULL_SCREEN_HEIGHT  ([UIScreen mainScreen].bounds.size.height)

#define FULL_SCREEN_HEIGHT  ([UIScreen mainScreen].bounds.size.height)

// 屏幕宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

// 屏幕高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

// 判断是否为iPhone X
#define IsiPhoneX (ScreenWidth == 375.f && ScreenHeight == 812.f ? YES : NO)
#define Is_iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

// 状态栏高度
#define StatusHeighe [[UIApplication sharedApplication] statusBarFrame].size.height

//导航栏高度
#define NaviBarHeight self.navigationController.navigationBar.frame.size.height

//状态栏和导航栏的高度
#define NaviBarStatusBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height+self.navigationController.navigationBar.frame.size.height)

//底部菜单栏高度
#define TabBarHeight self.tabBarController.tabBar.frame.size.height

//安全区
#define ViewSafeAreInsets(view) ({UIEdgeInsets insets; if(@available(iOS 11.0, *)) {insets = view.safeAreaInsets;} else {insets = UIEdgeInsetsZero;} insets;})





#endif /* JFMacroHeader_h */
