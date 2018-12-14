//
//  JFScrollAnimationView.h
//  test
//
//  Created by je_ffy on 2018/12/14.
//  Copyright © 2018年 je_ffy. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JFScrollAnimationView : UIView

@property (nonatomic, strong) UIImageView *imageView;

/**
 imageView的横坐标 用于拖拽过程中的动画
 */
@property (nonatomic, assign) CGFloat contentX;

@end

NS_ASSUME_NONNULL_END
