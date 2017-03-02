//
//  UIButton+SPBadge.h
//  ShangPin
//
//  Created by je_ffy on 16/7/22.
//  Copyright © 2016年 feng lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SPBadge)

@property (strong, nonatomic) UILabel *badgeLabel;
/**
 *  角标显示的信息，可以为数字和文字
 */
@property (nonatomic) NSString *badge;
/**
 *  角标背景颜色，默认为蓝色
 */
@property (nonatomic) UIColor *badgeBGColor;
/**
 *  角标文字的颜色
 */
@property (nonatomic) UIColor *badgeTextColor;
/**
 *  角标字号
 */
@property (nonatomic) UIFont *badgeFont;
/**
 *  角标的气泡边界,距离上跟右的距离
 */
@property (nonatomic) CGFloat badgePadding;
/**
 *  角标的最小尺寸
 */
@property (nonatomic) CGFloat badgeMinSize;
/**
 *  角标的x值
 */
@property (nonatomic) CGFloat badgeOriginX;
/**
 *  角标的y值
 */
@property (nonatomic) CGFloat badgeOriginY;
/**
 *  当角标为0时，自动去除角标
 */
@property BOOL shouldHideBadgeAtZero;
/**
 *  当角标的值发生变化，角标的动画是否显示
 */
@property BOOL shouldAnimateBadge;

@end
