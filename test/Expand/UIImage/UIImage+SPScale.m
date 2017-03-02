//
//  UIImage+SPScale.m
//  AppForSPAolai
//
//  Created by feng lu on 13-9-17.
//  Copyright (c) 2013年 feng lu. All rights reserved.
//

#import "UIImage+SPScale.h"

@implementation UIImage (SPScale)


+ (UIImage*)scaleImage:(UIImage*)img toSize:(CGSize)size{
    int h = img.size.height;
    int w = img.size.width;
    
    if(h <= size.height && w <= size.width) {
        return img;
    } else {
        float destWith = 0.0f;
        float destHeight = 0.0f;
        
        float suoFang = (float)w/h;
        float suo = (float)h/w;
        if (w>h) {
            destWith = (float)size.width;
            destHeight = size.width * suo;
        }else {
            destHeight = (float)size.height;
            destWith = size.height * suoFang;
        }
        
        CGSize itemSize = CGSizeMake(destWith, destHeight);
        UIGraphicsBeginImageContext(itemSize);
        CGRect imageRect = CGRectMake(0, 0, destWith, destHeight);
        [img drawInRect:imageRect];
        UIImage *newImg = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        return newImg;
    }
}

@end
