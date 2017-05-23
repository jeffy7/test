//
//  JFTuhaoTableViewCell.m
//  test
//
//  Created by je_ffy on 2017/5/23.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFTuhaoTableViewCell.h"

@interface JFTuhaoTableViewCell ()

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *rightImageView;

@end

@implementation JFTuhaoTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).offset(5);
            make.top.equalTo(self).offset(5);
            make.bottom.equalTo(self).offset(-5);
//            make.width.equalTo()
        }];
        
    }
    
    return self;
}

- (UIImageView *)leftImageView {
    if (!_leftImageView) {
        UIImageView *leftImageView = [[UIImageView alloc] init];
        [self addSubview:_leftImageView = leftImageView];
    }
    
    return _leftImageView;
}

- (UIImageView *)rightImageView {
    if (!_rightImageView) {
        UIImageView *rightImageView = [[UIImageView alloc] init];
        [self addSubview:_rightImageView = rightImageView];
    }
    
    return _rightImageView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
