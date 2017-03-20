//
//  UIView+JFCorner.h
//  test
//
//  Created by je_ffy on 2017/3/14.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (JFCorner)

- (void)addCorner:(float)radius
          bgColor:(UIColor *)bgColor
      borderWidth:(float)borderWidth
      borderColor:(UIColor *)borderColor;

@end
