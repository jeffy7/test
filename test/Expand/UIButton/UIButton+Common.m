//
//  UIButton+Common.m
//  Daiyanxiu
//
//  Created by MyMac on 16/4/16.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "UIButton+Common.h"
#import "NSString+Extension.h"
#import "UIView+LayoutMethods.h"

@implementation UIButton (Common)

- (void)setOwnerNameTitle:(NSString *)aUserName font:(UIFont *)font maxWidth:(CGFloat)maxWidth{
    [self setTitle:aUserName forState:UIControlStateNormal];
    CGRect frame = self.frame;
    CGFloat titleWidth = [self.titleLabel.text sizeWithFont:font maxH:frame.size.height].width;
    if (titleWidth > maxWidth) {
        titleWidth = maxWidth;
    }
    [self setWidth:titleWidth];
    [self.titleLabel setWidth:titleWidth];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state
{
    [self setBackgroundImage:[UIButton imageWithColor:backgroundColor] forState:state];
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

@end
