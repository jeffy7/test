//
//  UILabel+Common.m
//  Daiyanxiu
//
//  Created by MyMac on 16/4/16.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "UILabel+Common.h"

@implementation UILabel (Common)

- (void)setLongString:(NSString *)str withFitWidth:(CGFloat)width {
    self.numberOfLines = 0;
    CGSize resultSize = [str sizeWithFont:self.font maxW:width];
    CGFloat resultHeight = resultSize.height;
    CGRect frame = self.frame;
    frame.size.height = resultHeight;
    [self setFrame:frame];
    self.text = str;
}

@end
