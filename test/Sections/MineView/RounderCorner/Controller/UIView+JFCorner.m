//
//  UIView+JFCorner.m
//  test
//
//  Created by je_ffy on 2017/3/14.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "UIView+JFCorner.h"

@implementation UIView (JFCorner)

- (UIImage *)drawRectWithCorner:(float)radius
                        bgColor:(UIColor *)bgColor
                    borderWidth:(float)borderWidth
                    borderColor:(UIColor *)borderColor {
    
    UIGraphicsBeginImageContextWithOptions(self.frame.size, false, UIScreen.mainScreen.scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, bgColor.CGColor);
    CGContextSetLineWidth(context, borderWidth);
    CGContextSetStrokeColorWithColor(context, borderColor.CGColor);
    
    CGRect bounds = CGRectMake(borderWidth / 2.f, borderWidth / 2.f, self.bounds.size.width - borderWidth, self.bounds.size.height - borderWidth);
    
    CGContextMoveToPoint(context, CGRectGetMinX(bounds), radius);
    CGContextAddArcToPoint(context, CGRectGetMinX(bounds), CGRectGetMinY(bounds), radius, CGRectGetMinY(bounds), radius);
    CGContextAddArcToPoint(context, CGRectGetMaxX(bounds), CGRectGetMinY(bounds), CGRectGetMaxX(bounds), CGRectGetMinY(bounds) + radius, radius);
    CGContextAddArcToPoint(context, CGRectGetMaxX(bounds), CGRectGetMaxY(bounds), CGRectGetMaxX(bounds) - radius, CGRectGetMaxY(bounds), radius);
    CGContextAddArcToPoint(context, CGRectGetMinX(bounds), CGRectGetMaxY(bounds), CGRectGetMinX(bounds), CGRectGetMaxY(bounds) - radius, radius);
    
    CGContextClosePath(context);
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return output;
}


- (void)addCorner:(float)radius
          bgColor:(UIColor *)bgColor
      borderWidth:(float)borderWidth
      borderColor:(UIColor *)borderColor {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.image = [self drawRectWithCorner:radius bgColor:bgColor borderWidth:borderWidth / 2.f borderColor:borderColor];
    [self insertSubview:imageView atIndex:0];
}



@end
