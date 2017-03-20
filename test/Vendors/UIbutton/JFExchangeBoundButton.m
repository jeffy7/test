//
//  JFExchangeBoundButton.m
//  test
//
//  Created by je_ffy on 2017/3/20.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFExchangeBoundButton.h"

@implementation JFExchangeBoundButton


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event {
    
    //通过修改bounds 的x,y 值就可以只向X 轴或者Y轴的某一个方向扩展
    
    //当bounds 的X 为负,Y 为0,就只向X的正方向扩展点击区域,反之亦然
    
    //当bounds 的Y 为负,X 为0,就只向Y的正方向扩展点击区域,反之亦然
    
    //当bounds 的Y 为0,X 为0,widthDelta,heightDelta来控制扩大的点击区域 ,这个是同时向X 轴正负方向或者同时向Y轴的正负方向
    
    CGRect bounds = CGRectMake(0, -50, self.bounds.size.width  , self.bounds.size.height +50);
    
    return CGRectContainsPoint(bounds, point);
}

@end
