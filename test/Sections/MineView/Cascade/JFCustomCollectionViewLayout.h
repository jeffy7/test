//
//  JFCustomCollectionViewLayout.h
//  test
//
//  Created by je_ffy on 2017/5/18.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import <UIKit/UIKit.h>

@class JFCustomCollectionViewLayout;

@protocol JFCustomCollectionViewLayoutDelegate <NSObject>

@required
- (CGFloat)cascadeFlowLayout:(JFCustomCollectionViewLayout *)cascadeFlowLayout heightForRowAtIndexPath:(NSInteger)index itemWidth:(CGFloat)itemWidth;

@optional
- (CGFloat)columnCountInCascadeflowLayout:(JFCustomCollectionViewLayout *)cascadeflowLayout;
- (CGFloat)columnMarginInCascadeflowLayout:(JFCustomCollectionViewLayout *)cascadeflowLayout;
- (CGFloat)rowMarginIncasCadeflowLayout:(JFCustomCollectionViewLayout *)cascadeflowLayout;
- (UIEdgeInsets)edgeInsetsIncasCadeflowLayout:(JFCustomCollectionViewLayout *)cascadeflowLayout;

@end


@interface JFCustomCollectionViewLayout : UICollectionViewLayout

@property (weak, nonatomic) id<JFCustomCollectionViewLayoutDelegate> delegate;

@end
