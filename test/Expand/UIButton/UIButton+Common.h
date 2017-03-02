//
//  UIButton+Common.h
//  Daiyanxiu
//
//  Created by MyMac on 16/4/16.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Common)
/**
 *  根据标题文字自适应size按钮
 *
 *  @param aUserName 标题
 *  @param font      标题字号
 *  @param maxWidth  最大宽度
 */
- (void)setOwnerNameTitle:(NSString *)aUserName font:(UIFont *)font maxWidth:(CGFloat)maxWidth;

- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;

@end
