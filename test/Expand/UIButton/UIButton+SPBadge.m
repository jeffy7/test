//
//  UIButton+SPBadge.m
//  ShangPin
//
//  Created by je_ffy on 16/7/22.
//  Copyright © 2016年 feng lu. All rights reserved.
//

#import "UIButton+SPBadge.h"
#import <objc/runtime.h>
#import "UIColor+SPHex.h"
#import "UIColor+HEX.h"

#define NUMBER_FONT                         (@"Futura-Medium")


NSString const *badgeLabelKey            = @"badgeKey";
NSString const *badgeBGColorKey          = @"badgeBGColorKey";
NSString const *badgeTextColorKey        = @"badgeTextColorKey";
NSString const *badgeFontKey             = @"badgeFontKey";
NSString const *badgePaddingKey          = @"badgePaddingKey";
NSString const *badgeMinSizeKey          = @"badgeMinSizeKey";
NSString const *badgeOriginXKey          = @"badgeOriginXKey";
NSString const *badgeOriginYKey          = @"badgeOriginYKey";
NSString const *shouldHideBadgeAtZeroKey = @"shouldHideBadgeAtZeroKey";
NSString const *shouldAnimateBadgeKey    = @"shouldAnimateBadgeKey";
NSString const *badgeKey                 = @"badgeKey";
NSInteger const widthAndHeight           = 15;

@implementation UIButton (SPBadge)

#pragma mark -
#pragma mark - Unitly Method
- (void)badgeInit {
    // 初始化，设定默认值
    self.badgeBGColor   = [UIColor colorWithHex:0x0700c5];
    self.badgeTextColor = [UIColor whiteColor];
    self.badgeFont      = [UIFont fontWithName:NUMBER_FONT size:10.0];
    self.badgePadding   = 5;
    self.badgeMinSize   = 10;
    self.badgeOriginX   = self.frame.size.width - self.badgeLabel.frame.size.width;
    self.badgeOriginY   = 0;
    self.shouldHideBadgeAtZero = YES;
    self.shouldAnimateBadge = NO;
    // 避免角标被裁剪
    self.clipsToBounds = NO;
}

#pragma mark - Utility methods
// 当角标的属性改变时，调用此方法
- (void)refreshBadge {
    // 更新属性
    self.badgeLabel.textColor        = self.badgeTextColor;
    self.badgeLabel.backgroundColor  = self.badgeBGColor;
    self.badgeLabel.font             = self.badgeFont;
}

- (CGSize) badgeExpectedSize {
    // 自适应角标
    UILabel *frameLabel = [self duplicateLabel:self.badgeLabel];
    [frameLabel sizeToFit];
    
    CGSize expectedLabelSize = frameLabel.frame.size;
    return expectedLabelSize;
}
/**
 *  更新角标的frame
 */
- (void)updateBadgeFrame {
    CGSize expectedLabelSize = [self badgeExpectedSize];
    
    CGFloat minHeight = expectedLabelSize.height;
    CGFloat minWidth = expectedLabelSize.width;
    // 判断如果小于最小size，则为最小size
    minHeight = (minHeight < self.badgeMinSize) ? self.badgeMinSize : expectedLabelSize.height;
    minWidth = (minWidth < minHeight) ? minHeight : expectedLabelSize.width;
    
    CGFloat tarWidthAndheiight = (widthAndHeight > minWidth)?widthAndHeight:minWidth;
    CGFloat padding = self.badgePadding;
    
    // 填充边界
    self.badgeLabel.frame = CGRectMake(self.badgeOriginX - padding, self.badgeOriginY + padding, tarWidthAndheiight, tarWidthAndheiight);
    self.badgeLabel.layer.cornerRadius = tarWidthAndheiight/2;
    self.badgeLabel.layer.masksToBounds = YES;
}

// 角标值变化
- (void)updatebadgeAnimated:(BOOL)animated {
    // 动画效果
    if (animated && self.shouldAnimateBadge && ![self.badgeLabel.text isEqualToString:self.badge]) {
        CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        [animation setFromValue:[NSNumber numberWithFloat:1.5]];
        [animation setToValue:[NSNumber numberWithFloat:1]];
        [animation setDuration:0.2];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.4f :1.3f :1.f :1.f]];
        [self.badgeLabel.layer addAnimation:animation forKey:@"bounceAnimation"];
    }
    self.badgeLabel.text = self.badge;
    
    // 动画时间
    NSTimeInterval duration = animated ? 0.2 : 0;
    [UIView animateWithDuration:duration animations:^{
        [self updateBadgeFrame];
    }];
}

- (UILabel *)duplicateLabel:(UILabel *)labelToCopy {
    UILabel *duplicateLabel = [[UILabel alloc] initWithFrame:labelToCopy.frame];
    duplicateLabel.text = labelToCopy.text;
    duplicateLabel.font = labelToCopy.font;
    
    return duplicateLabel;
}

- (void)removeBadge {
    // 移除角标
    [UIView animateWithDuration:0.2 animations:^{
        self.badgeLabel.transform = CGAffineTransformMakeScale(0, 0);
    } completion:^(BOOL finished) {
        [self.badgeLabel removeFromSuperview];
        self.badgeLabel = nil;
    }];
}

#pragma mark - getters/setters
-(UILabel*)badgeLabel {
    return objc_getAssociatedObject(self, &badgeLabelKey);
}

-(void)setBadgeLabel:(UILabel *)badgeLabel {
    objc_setAssociatedObject(self, &badgeLabelKey, badgeLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSString *)badge {
    return objc_getAssociatedObject(self, &badgeKey);
}

-(void)setBadge:(NSString *)badge {
    objc_setAssociatedObject(self, &badgeKey, badge, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    // 当角标信息不存在，或者为空，则移除
    if (!badge || [badge isEqualToString:@""] || ([badge isEqualToString:@"0"] && self.shouldHideBadgeAtZero)) {
        [self removeBadge];
    } else if (!self.badgeLabel && ![badge isEqualToString:@""] && !([badge isEqualToString:@"0"])) {
        //当又有值时，重新设置角标
        self.badgeLabel                      = [[UILabel alloc] initWithFrame:CGRectMake(self.badgeOriginX, self.badgeOriginY, widthAndHeight, widthAndHeight)];
        self.badgeLabel.textColor            = self.badgeTextColor;
        self.badgeLabel.backgroundColor      = self.badgeBGColor;
        self.badgeLabel.font                 = self.badgeFont;
        self.badgeLabel.textAlignment        = NSTextAlignmentCenter;
        [self badgeInit];
        [self addSubview:self.badgeLabel];
        [self updatebadgeAnimated:NO];
    } else {
        [self updatebadgeAnimated:YES];
    }
}

-(UIColor *)badgeBGColor {
    return objc_getAssociatedObject(self, &badgeBGColorKey);
}

-(void)setBadgeBGColor:(UIColor *)badgeBGColor {
    objc_setAssociatedObject(self, &badgeBGColorKey, badgeBGColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badgeLabel) {
        [self refreshBadge];
    }
}

-(UIColor *)badgeTextColor {
    return objc_getAssociatedObject(self, &badgeTextColorKey);
}

-(void)setBadgeTextColor:(UIColor *)badgeTextColor {
    objc_setAssociatedObject(self, &badgeTextColorKey, badgeTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badgeLabel) {
        [self refreshBadge];
    }
}

-(UIFont *)badgeFont {
    return objc_getAssociatedObject(self, &badgeFontKey);
}

-(void)setBadgeFont:(UIFont *)badgeFont {
    objc_setAssociatedObject(self, &badgeFontKey, badgeFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badgeLabel) {
        [self refreshBadge];
    }
}

-(CGFloat)badgePadding {
    NSNumber *number = objc_getAssociatedObject(self, &badgePaddingKey);
    return number.floatValue;
}

-(void)setBadgePadding:(CGFloat)badgePadding {
    NSNumber *number = [NSNumber numberWithDouble:badgePadding];
    objc_setAssociatedObject(self, &badgePaddingKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badgeLabel) {
        [self updateBadgeFrame];
    }
}

-(CGFloat)badgeMinSize {
    NSNumber *number = objc_getAssociatedObject(self, &badgeMinSizeKey);
    return number.floatValue;
}

-(void) setBadgeMinSize:(CGFloat)badgeMinSize {
    NSNumber *number = [NSNumber numberWithDouble:badgeMinSize];
    objc_setAssociatedObject(self, &badgeMinSizeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badgeLabel) {
        [self updateBadgeFrame];
    }
}

-(CGFloat)badgeOriginX {
    NSNumber *number = objc_getAssociatedObject(self, &badgeOriginXKey);
    return number.floatValue;
}

-(void)setBadgeOriginX:(CGFloat)badgeOriginX {
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginX];
    objc_setAssociatedObject(self, &badgeOriginXKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badgeLabel) {
        [self updateBadgeFrame];
    }
}

-(CGFloat)badgeOriginY {
    NSNumber *number = objc_getAssociatedObject(self, &badgeOriginYKey);
    return number.floatValue;
}

-(void)setBadgeOriginY:(CGFloat)badgeOriginY {
    NSNumber *number = [NSNumber numberWithDouble:badgeOriginY];
    objc_setAssociatedObject(self, &badgeOriginYKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badgeLabel) {
        [self updateBadgeFrame];
    }
}

-(BOOL)shouldHideBadgeAtZero {
    NSNumber *number = objc_getAssociatedObject(self, &shouldHideBadgeAtZeroKey);
    return number.boolValue;
}

- (void)setShouldHideBadgeAtZero:(BOOL)shouldHideBadgeAtZero {
    NSNumber *number = [NSNumber numberWithBool:shouldHideBadgeAtZero];
    objc_setAssociatedObject(self, &shouldHideBadgeAtZeroKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(BOOL)shouldAnimateBadge {
    NSNumber *number = objc_getAssociatedObject(self, &shouldAnimateBadgeKey);
    return number.boolValue;
}

- (void)setShouldAnimateBadge:(BOOL)shouldAnimateBadge {
    NSNumber *number = [NSNumber numberWithBool:shouldAnimateBadge];
    objc_setAssociatedObject(self, &shouldAnimateBadgeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
