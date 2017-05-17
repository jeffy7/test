//
//  JFFollowWeiboCollectionReusableView.m
//  test
//
//  Created by je_ffy on 2017/5/13.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFFollowWeiboCollectionReusableView.h"

@interface JFFollowWeiboCollectionReusableView ()

@property (nonatomic, strong) UIButton *moreButton;

@end

@implementation JFFollowWeiboCollectionReusableView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.frame = CGRectMake(0, 0, FULL_SCREEN_WIDTH, 44);
        
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self);
            make.width.equalTo(@50);
        }];
        
        [self.moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(self);
            make.width.equalTo(@100);
        }];
    }
    
    return self;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        UILabel *titleLabel = [[UILabel alloc] init];
        titleLabel.textAlignment = NSTextAlignmentLeft;
        titleLabel.font = [UIFont systemFontOfSize:12.0f];
        titleLabel.textColor = [UIColor blackColor];
        [self addSubview:_titleLabel = titleLabel];
    }
    
    return _titleLabel;
}

- (UIButton *)moreButton {
    if (!_moreButton) {
        UIButton *moreButton = [[UIButton alloc] init];
        [moreButton addTarget:self action:@selector(doNothing) forControlEvents:UIControlEventTouchUpInside];
        [moreButton setTitle:@"显示更多 >" forState:UIControlStateNormal];
        [self addSubview:_moreButton = moreButton];
    }
    
    return _moreButton;
}

- (void)doNothing {
    
}

@end
