//
//  UIImage+Common.m
//  DYStore
//
//  Created by MyMac on 16/1/26.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import "UIImage+Common.h"

@implementation UIImage (Common)

+(UIImage *)imageWithColor:(UIColor *)aColor{
    return [UIImage imageWithColor:aColor withFrame:CGRectMake(0, 0, 1, 1)];
}

+(UIImage *)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame{
    UIGraphicsBeginImageContext(aFrame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [aColor CGColor]);
    CGContextFillRect(context, aFrame);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
}

//图片尺寸压缩
- (UIImage *)scaleToSize:(CGSize)targetSize {
    UIImage *sourceImage = self;
    UIImage *newImage = nil;
    CGSize imageSize = sourceImage.size;
    CGFloat scaleFactor = 0.0;
    if (CGSizeEqualToSize(imageSize, targetSize) == NO) {
        CGFloat widthFactor = targetSize.width / imageSize.width;
        CGFloat heightFactor = targetSize.height / imageSize.height;
        if (widthFactor < heightFactor) {
            scaleFactor = heightFactor;
        }else {
            scaleFactor = widthFactor;
        }
    }
    
    scaleFactor = MIN(scaleFactor, 1.0);
    CGFloat targetWidth = imageSize.width * scaleFactor;
    CGFloat targetHeight = imageSize.height * scaleFactor;
    
    targetSize = CGSizeMake(floor(targetWidth), floor(targetHeight));
    UIGraphicsBeginImageContext(targetSize);
    [sourceImage drawInRect:CGRectMake(0, 0, ceilf(targetWidth), ceilf(targetHeight))];
    newImage = UIGraphicsGetImageFromCurrentImageContext();
    if (newImage == nil) {
        //DBLog(@"不能缩放图像");
        newImage = sourceImage;
    }
    UIGraphicsEndImageContext();
    return newImage;
    
}

- (UIImage *)scaleToSize:(CGSize)targetSize highQuality:(BOOL)highQuality {
    if (highQuality) {
        targetSize = CGSizeMake(2 * targetSize.width, 2 * targetSize.height);
    }
    return [self scaleToSize:targetSize];
}

- (UIImage *)scaleToMaxSize:(CGSize)maxSize {
    CGFloat width = maxSize.width;
    CGFloat height = maxSize.height;
    
    CGFloat oldWidth = self.size.width;
    CGFloat oldHeight = self.size.height;
    
    CGFloat scaleFactor = (oldWidth > oldHeight) ? width / oldWidth : height / oldHeight;
    
    if (scaleFactor > 1.0) {
        return self;
    }
    
    CGFloat newHeight = oldHeight * scaleFactor;
    CGFloat newWidth = oldWidth * scaleFactor;
    CGSize newSize = CGSizeMake(newWidth, newHeight);
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [self drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
        
}

+ (UIImage *)scaleImage:(NSString *)imagename scaleindex:(CGFloat)index
{
    UIImage *image = [[UIImage alloc]initWithCGImage:[UIImage imageNamed:imagename].CGImage scale:index orientation:UIImageOrientationUp];
    return image;
}

+ (UIImage *)fullResolutionImageFromALAsset:(ALAsset *)asset{
    ALAssetRepresentation *assetRep = [asset defaultRepresentation];
    CGImageRef imgRef = [assetRep fullResolutionImage];
    UIImage *img = [UIImage imageWithCGImage:imgRef scale:assetRep.scale orientation:(UIImageOrientation)assetRep.orientation];
    return img;
}

+ (UIImage *)fullScreenImageALAsset:(ALAsset *)asset{
    ALAssetRepresentation *assetRep = [asset defaultRepresentation];
    CGImageRef imgRef = [assetRep fullScreenImage];//fullScreenImage已经调整过方向了
    UIImage *img = [UIImage imageWithCGImage:imgRef];
    return img;
}

//切圆角和边框
+ (UIImage *)imageWithBorderWidth:(CGFloat)borderW borderColor:(UIColor *)color image:(UIImage *)image {
    
    //3.开启图片上下文.
    CGSize size = CGSizeMake(image.size.width + 2 * borderW, image.size.height + 2 * borderW);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    //4.先描述一个大圆,设为填充
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    //设置边框的颜色
    [color set];
    [path fill];
    //5.再添加一个小圆,把小圆设裁剪区域
    
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    [path addClip];
    
    //6.把图片给绘制上下文.
    [image drawInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    //7.生成一张新的图片
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    //8.关闭上下文.
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

//只切圆角
+ (UIImage *)imageWithCircularAngleImage:(UIImage *)image {
    
    return [self imageWithBorderWidth:0 borderColor:[UIColor whiteColor] image:image];
}

@end
