//
//  UIImage+Url.m
//  ShangPin
//
//  Created by 唐彬琪 on 13-1-9.
//  Copyright (c) 2013年 feng lu. All rights reserved.
//

#import "UIImage+Url.h"
#import <objc/runtime.h>

@implementation UIImage (Url)

- (NSString *)imageUrl{
    return (NSString *) objc_getAssociatedObject([NSString class], @"imageUrl");
}
@end
