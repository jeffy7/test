//
//  UIColor+SPHex.h
//  ShangPin
//
//  Created by feng lu on 15/1/22.
//  Copyright (c) 2015年 feng lu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SPHex)
+ (UIColor *)colorWithSPHex:(NSString*)hexColor;
+ (UIColor *)colorWithSPHex:(NSString*)hexColor alpha:(float)opacity;
@end
