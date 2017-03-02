//
//  UILabel+Common.h
//  Daiyanxiu
//
//  Created by MyMac on 16/4/16.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Common)
//根据文本 以及适应宽度  自适应label 的size
- (void)setLongString:(NSString *)str withFitWidth:(CGFloat)width;

@end
