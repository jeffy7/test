//
//  JFMasonryCollectionViewCell.m
//  test
//
//  Created by je_ffy on 2017/6/11.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFMasonryCollectionViewCell.h"

@interface JFMasonryCollectionViewCell ()

@property (nonatomic, strong) UIView      *priceView;
@property (nonatomic, strong) UILabel     *priceLabel;
@property (nonatomic, strong) UILabel     *goldDescLabel;

@end

@implementation JFMasonryCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self =[super initWithFrame:frame]) {
        
        [self addSubview:self.priceView];
        [self.priceView addSubview:self.priceLabel];
        [self.priceView addSubview:self.goldDescLabel];
        
        [self mas_makeConstraints];
    }
    
    return self;
}
- (UIView *)priceView {
    if (!_priceView) {
        UIView *priceView = [[UIView alloc] init];
        _priceView = priceView;
        _priceView.layer.borderWidth = 0.50f;
        _priceView.layer.borderColor = [UIColor redColor].CGColor;
    }
    
    return _priceView;
}

- (UILabel *)priceLabel {
    if (!_priceLabel) {
        _priceLabel = [UILabel new];
        _priceLabel.textColor = [UIColor colorWithHex:0x000000];
        _priceLabel.backgroundColor = UIColor.whiteColor;
        _priceLabel.font = [UIFont fontWithName:@"Futura-Medium" size:14.0f];
        _priceLabel.numberOfLines = 1;
        _priceLabel.textAlignment = NSTextAlignmentCenter;
        _priceLabel.layer.borderWidth = 0.50f;
        _priceLabel.layer.borderColor = [UIColor blueColor].CGColor;
    }
    
    return _priceLabel;
}

- (UILabel *)goldDescLabel {
    if (!_goldDescLabel) {
        UILabel *goldDescLabel = [[UILabel alloc] init];
        goldDescLabel.font = [UIFont fontWithName:@"Futura-Medium" size:9.0f];
        goldDescLabel.textColor = [UIColor colorWithHex:0x0700c5];
        goldDescLabel.textAlignment = NSTextAlignmentCenter;
        goldDescLabel.layer.borderWidth = 0.50f;
        goldDescLabel.layer.borderColor = [UIColor colorWithHex:0x0700c5].CGColor;
        [_priceView addSubview:_goldDescLabel = goldDescLabel];
        _goldDescLabel.layer.borderWidth = 0.50f;
        _goldDescLabel.layer.borderColor = [UIColor redColor].CGColor;
    }
    
    return _goldDescLabel;
}

- (void)mas_makeConstraints {
    [self.priceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).mas_offset(100);
        make.height.equalTo(@20);
        make.centerX.mas_equalTo(self);
    }];
    
    [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(_priceView);
        make.height.equalTo(_priceView);
    }];
    
    [self.goldDescLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_priceLabel.mas_right).offset(5);
        make.centerY.equalTo(_priceLabel);
        make.height.equalTo(@14);
        make.right.equalTo(_priceView);
    }];
    
}

- (void)setModel:(JFMasonryModel *)model {
    _model = model;
    NSMutableAttributedString *displayAttributeStr = [[NSMutableAttributedString alloc] init];

    // 价格
    NSMutableAttributedString *priceAttributeStr;
    if (self.model.salePrice.length > 0) {
        NSString *priceStr = [NSString stringWithFormat:@"¥%@ ", _model.salePrice];
        priceAttributeStr = [[NSMutableAttributedString alloc] initWithString:priceStr
                                                                   attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Futura-Medium" size:14],
                                                                                NSForegroundColorAttributeName:[UIColor redColor]}];
    }
    
    // 价格描述
    NSMutableAttributedString *descAttributeStr;
    if (self.model.priceDesc.length) {
        UIColor *originColor = [UIColor colorWithHex:0x888888];
        descAttributeStr = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ ", self.model.priceDesc]
                                                                  attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Futura-Medium" size:12],
                                                                               NSForegroundColorAttributeName:originColor}];
        

    }
    

    if (descAttributeStr) {
        [displayAttributeStr appendAttributedString:descAttributeStr];
    }
    if (priceAttributeStr) {
        [displayAttributeStr appendAttributedString:priceAttributeStr];
    }
    
    CGSize size = [displayAttributeStr boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 14) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading context:nil].size;
    [self.priceLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(_priceView);
        make.width.equalTo(@(ceil(size.width + 5)));
        make.height.equalTo(_priceView);
    }];
    
    [self.priceLabel setAttributedText:displayAttributeStr];
    //金牌优惠
    if (self.model.goldStr && [self.model.goldStr length] > 0 && self.model.salePrice.length > 0) {
        _goldDescLabel.text = self.model.goldStr;
        CGRect goldLabelFrame = [self.model.goldStr boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, 20)
                                                                        options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                                     attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Futura-Medium" size:9.0f]}
                                                                        context:nil];
        CGFloat goldLabelWidth = goldLabelFrame.size.width + 10;
        [_goldDescLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(goldLabelWidth));
        }];
        _goldDescLabel.hidden = NO;
    }else {
        [_goldDescLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(0));
        }];
        _goldDescLabel.hidden = YES;
    }
    
}

@end
