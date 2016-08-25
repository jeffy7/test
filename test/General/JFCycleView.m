//
//  JFCycleView.m
//  test
//
//  Created by je_ffy on 16/7/25.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "JFCycleView.h"

#define SCROLL_D_VALUE  (64.0f)

@interface JFCycleView ()

@property (nonatomic, assign) float startPI;
@property (nonatomic, assign) float endPI;
@property (nonatomic, assign) float maxPI;
@property (nonatomic, assign) float scrollDValue;

@end
@implementation JFCycleView

- (id)init {
    self = [super init];
    if (self) {
        // Initialization code
        _startPI = - M_PI_2;
        _endPI = - M_PI_2;
        _maxPI = M_PI + M_PI_4;    // -1.57+5.5
        
        _scrollDValue = SCROLL_D_VALUE;
        
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}

- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change {
    
}
- (void)scrollDidScroll:(UIScrollView *)scrollView {
    if (-scrollView.contentOffset.y > _scrollDValue) {
        // 当前的contentOffset
        CGFloat offsetY = scrollView.contentOffset.y;
        // 头部控件刚好出现的offsetY
        CGFloat pullingPercent = (-_scrollDValue - offsetY) / (54.0f);

        _endPI = - M_PI_2 + (_maxPI+M_PI_2) *pullingPercent;
        if (_endPI > _maxPI) {
            _endPI = _maxPI;
        }
        [self setNeedsDisplay];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    //画圆
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0f);
    CGContextSetRGBStrokeColor(context, 48/255.0f, 48/255.0f, 48/255.0f, 1.0f);
    CGContextAddArc(context, 24.0f, 24.0f, 8.0f, _startPI, _endPI, 0);
    CGContextStrokePath(context);
    /*
    //以多少为半径围绕圆心画指定角度扇形
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0f);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);//填充颜色
    CGContextMoveToPoint(context, 24, 24);
    CGContextAddArc(context, 24, 24, 10,  _startPI, _endPI, 0);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径
     */
}


- (void)rotateTheCircle {
    CFTimeInterval pausedTime = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
    self.layer.speed = 1.0;
    self.layer.timeOffset = pausedTime;
    
    CABasicAnimation* rotationAnimation = nil;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0 ];
    rotationAnimation.duration = 1.0f;
    rotationAnimation.removedOnCompletion = NO;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = MAXFLOAT;
    
    [self.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

- (void)stopTheCircleRote {
    CABasicAnimation *rotationAnimation = (CABasicAnimation *)[self.layer animationForKey:@"rotationAnimation"];
    
    if (rotationAnimation != nil) {
        CFTimeInterval pausedTime = [self.layer convertTime:CACurrentMediaTime() fromLayer:nil];
        self.layer.speed = 0.0;
        self.layer.timeOffset = pausedTime;
    }
}

- (void)clearTheAnimation {
    [self.layer removeAnimationForKey:@"rotationAnimation"];
    
    _endPI = - M_PI_2;
    [self setNeedsDisplay];
}


@end
