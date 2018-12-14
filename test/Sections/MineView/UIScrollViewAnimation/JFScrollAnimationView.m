//
//  JFScrollAnimationView.m
//  test
//
//  Created by je_ffy on 2018/12/14.
//  Copyright © 2018年 je_ffy. All rights reserved.
//

#import "JFScrollAnimationView.h"

@implementation JFScrollAnimationView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.clipsToBounds = YES;

        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [self addSubview:_imageView];
    }
    
    return self;
}

- (void)setContentX:(CGFloat)contentX {
    _contentX = contentX;
    _imageView.frame = CGRectMake(contentX, 0, self.frame.size.width, self.frame.size.height);
}



@end
