//
//  SPTextField.m
//  ShangPin
//
//  Created by je_ffy on 14-8-29.
//  Copyright (c) 2014年 feng lu. All rights reserved.
//

#import "SPTextField.h"

@implementation SPTextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


-(CGRect)placeholderRectForBounds:(CGRect)bounds
{
    
    CGRect inset = CGRectMake(bounds.origin.x, bounds.origin.y +(38-12)/2, bounds.size.width, bounds.size.height);
    return inset;
}

- (void)drawPlaceholderInRect:(CGRect)rect {

   
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorRef color = [[UIColor colorWithHex:0x000000] CGColor];
    CGContextSetFillColorWithColor(context, color);
    
    [[self placeholder] drawInRect:rect withFont:[UIFont systemFontOfSize:12.0f]];
    
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
