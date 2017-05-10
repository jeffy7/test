//
//  JFStockTableViewCell.m
//  test
//
//  Created by je_ffy on 2017/5/10.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFStockTableViewCell.h"

@interface JFStockTableViewCell ()<UIScrollViewDelegate>

@property (nonatomic, strong) UILabel * titleLabel;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) CGFloat labelW;
@property (nonatomic, strong) NSArray *arr;

@end

@implementation JFStockTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _arr = @[@"1.1662", @"0.01%", @"1.5880",@"3.72%",@"购买"];

        _labelW = [UIScreen mainScreen].bounds.size.width / 5;
        [self prepareSubview];
    }
    
    return self;
}

- (void)prepareSubview {

    [self addSubview:self.titleLabel];
    [self addSubview:self.scrollView];
    [_arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel *label = [UILabel new];
        label.frame = CGRectMake(_labelW*idx, 0, _labelW, 44);
        label.text = obj;
        label.textAlignment = NSTextAlignmentCenter;
        [_scrollView addSubview:label];
    }];
}


- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, _labelW, 44)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.text = @"title";
    }
    
    return _titleLabel;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {

        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(_labelW, 0, FULL_SCREEN_WIDTH - _labelW, 44)];
        _scrollView.layer.borderWidth = 0.50f;
        _scrollView.layer.borderColor = [UIColor redColor].CGColor;
        _scrollView.delegate = self;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.contentSize = CGSizeMake(_labelW*_arr.count, 44);
        
        
        
    }
    
    return _scrollView;
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
