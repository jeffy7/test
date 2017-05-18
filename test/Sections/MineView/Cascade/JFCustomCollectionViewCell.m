//
//  JFCustomCollectionViewCell.m
//  test
//
//  Created by je_ffy on 2017/5/18.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFCustomCollectionViewCell.h"

@interface JFCustomCollectionViewCell ()
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UIImageView *picImageview;

@end

@implementation JFCustomCollectionViewCell

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self.picImageview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        [self.indexLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(self);
            make.width.height.equalTo(@20);
        }];
        
        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.bottom.right.equalTo(self);
            make.height.equalTo(@14);
        }];
        
        
    }
    
    return self;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        UILabel *priceLabel = [[UILabel alloc] init];
        priceLabel.backgroundColor = [UIColor grayColor];
        priceLabel.textColor = [UIColor blackColor];
        priceLabel.font = [UIFont systemFontOfSize:12.0f];
        priceLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_priceLabel = priceLabel];
    }
    
    return _priceLabel;
}

- (UILabel *)indexLabel {
    if (!_indexLabel) {
        UILabel *indexLabel = [[UILabel alloc] init];
        indexLabel.backgroundColor = [UIColor redColor];
        indexLabel.layer.cornerRadius = 10;
        indexLabel.layer.masksToBounds = YES;
        indexLabel.textColor = [UIColor blackColor];
        indexLabel.font = [UIFont systemFontOfSize:12.0f];
        indexLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_indexLabel = indexLabel];
    }
    
    return _indexLabel;
}

- (UIImageView *)picImageview {
    if (!_picImageview) {
        UIImageView *picImageview =[[UIImageView alloc] init];
        picImageview.contentMode = UIViewContentModeScaleToFill;
        [self addSubview:_picImageview = picImageview];
    }
    
    return _picImageview;
}
- (void)setProduct:(JFCascadeProduct *)product {
    _priceLabel.text = product.price;
    
    [_picImageview sd_setImageWithURL:[NSURL URLWithString:product.img]];
}

@end
