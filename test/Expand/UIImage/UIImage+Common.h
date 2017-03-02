//
//  UIImage+Common.h
//  DYStore
//
//  Created by MyMac on 16/1/26.
//  Copyright © 2016年 MyMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface UIImage (Common)

+ (UIImage *)imageWithColor:(UIColor *)aColor;
+ (UIImage *)imageWithColor:(UIColor *)aColor withFrame:(CGRect)aFrame;
- (UIImage *)scaleToSize:(CGSize)targetSize;
- (UIImage *)scaleToSize:(CGSize)targetSize highQuality:(BOOL)highQuality;
- (UIImage *)scaleToMaxSize:(CGSize)maxSize;
+ (UIImage *)scaleImage:(NSString *)imagename scaleindex:(CGFloat)index;

+ (UIImage *)fullResolutionImageFromALAsset:(ALAsset *)asset;
+ (UIImage *)fullScreenImageALAsset:(ALAsset *)asset;

//给图片设置边框 + 切圆角
//borderW 边框大小
//color 边框颜色
+ (UIImage *)imageWithBorderWidth:(CGFloat)borderW borderColor:(UIColor *)color image:(UIImage *)image;

//只切圆角
+ (UIImage *)imageWithCircularAngleImage:(UIImage *)image;

@end
