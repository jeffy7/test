//
//  UIColor+Hex.m
//  ShangPin
//
//  Created by feng lu on 15/1/22.
//  Copyright (c) 2015年 feng lu. All rights reserved.
//

#import "UIColor+SPHex.h"

@implementation UIColor (SPHex)


+ (UIColor *)colorWithSPHex:(NSString*)hexColor
{
    return [UIColor colorWithSPHex:hexColor alpha:1.];
}


+ (UIColor *)colorWithSPHex:(NSString*)hexColor alpha:(float)opacity
{
    if (hexColor.length < 7) {
        return [UIColor blackColor];
    }
    NSRange range;
    range.location = 1;
    range.length = 2;
    NSString *rString = [hexColor substringWithRange:range];
    
    range.location = 3;
    NSString *gString = [hexColor substringWithRange:range];
    
    range.location = 5;
    NSString *bString = [hexColor substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0];
}


@end
