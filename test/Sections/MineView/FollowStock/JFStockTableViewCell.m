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
@property (nonatomic, assign) CGFloat labelW;
@property (nonatomic, strong) NSArray *arr;
@property (nonatomic, assign) BOOL isNotification;

@property (nonatomic, assign) float cellLastX; //最后的cell的移动距离


@end

@implementation JFStockTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _arr = @[@"1.1662", @"0.01%", @"1.5880",@"3.72%",@"购买"];

        _labelW = [UIScreen mainScreen].bounds.size.width / 5;
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        [self.scrollView addGestureRecognizer:tapGes];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(scrollMove:) name:tapCellScrollNotification object:nil];
        
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

-(void)scrollMove:(NSNotification*)notification{
    NSDictionary *noticeInfo = notification.userInfo;
    NSObject *obj = notification.object;
    float x = [noticeInfo[@"cellOffX"] floatValue];
    self.cellLastX = x;
    CGPoint offSet = self.scrollView.contentOffset;
    offSet.x = x;
    self.scrollView.contentOffset = offSet;
    obj = nil;
}

#pragma mark -
#pragma mark - UIScrollViewDelegate
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //人为滑动的cell 将通知 设置为No
    _isNotification = NO;
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (!_isNotification) {
        // 发送通知
        [[NSNotificationCenter defaultCenter] postNotificationName:tapCellScrollNotification object:self userInfo:@{@"cellOffX":@(scrollView.contentOffset.x)}];
    }
    _isNotification = NO;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 避开自己发的通知，只有手指拨动才会是自己的滚动
    if (!_isNotification) {
        // 发送通知
        [[NSNotificationCenter defaultCenter] postNotificationName:tapCellScrollNotification object:self userInfo:@{@"cellOffX":@(scrollView.contentOffset.x)}];
    }
    _isNotification = NO;
}

- (void)tapAction:(UITapGestureRecognizer *)gesture {
    __weak typeof (self) weakSelf = self;
    if (self.tapCellClick) {
        NSIndexPath *indexPath = [weakSelf.tableView indexPathForCell:weakSelf];
        weakSelf.tapCellClick(indexPath);
    }
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        
        return NO;
    }
    
    return YES;
}

@end
