//
//  JFCornerView.m
//  test
//
//  Created by je_ffy on 2017/3/14.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFCornerView.h"

@implementation JFCornerView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)layoutSubviews{
    [super layoutSubviews];
    CGFloat corner = 50;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight | UIRectCornerBottomLeft cornerRadii:CGSizeMake(corner, corner)].CGPath;
    self.layer.mask = shapeLayer;
}

@end
