//
//  JFCustomCollectionViewCell.h
//  test
//
//  Created by je_ffy on 2017/5/18.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFCascadeProduct.h"

@interface JFCustomCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) JFCascadeProduct *product;
@property (nonatomic, strong) UILabel *indexLabel;

@end
