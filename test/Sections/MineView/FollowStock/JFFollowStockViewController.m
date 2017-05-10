//
//  JFFollowStockViewController.m
//  test
//
//  Created by je_ffy on 2017/5/10.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFFollowStockViewController.h"
#import "JFStockTableViewCell.h"

NSString * const identifire = @"stockCell";

@interface JFFollowStockViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *tableViewHeader;

@property (nonatomic, strong) UIScrollView *headerScrollview;

@end

@implementation JFFollowStockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    self.tableView.tableHeaderView = self.tableViewHeader;
    // Do any additional setup after loading the view.
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
        [_tableView registerClass:[JFStockTableViewCell class] forCellReuseIdentifier:identifire];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    
    return _tableView;
}

- (UIView *)tableViewHeader {
    if (!_tableViewHeader) {
        _tableViewHeader = [[UIView alloc] initWithFrame:CGRectMake(0, 0, FULL_SCREEN_WIDTH, 200)];
        _tableViewHeader.layer.borderWidth = 0.50f;
        _tableViewHeader.layer.borderColor = [UIColor redColor].CGColor;
    }
    
    return _tableViewHeader;
}

#pragma mark -
#pragma mark - UITableViewDelagate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JFStockTableViewCell *cell = (JFStockTableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifire];
    if (indexPath.row % 2 != 0) {
        cell.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.2];
    } else {
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    headerView.backgroundColor = [UIColor whiteColor];
    
    CGFloat lblW = self.view.bounds.size.width / 5;
    
    UILabel *titleLbl = [UILabel new];
    titleLbl.frame = CGRectMake(0, 0, lblW, 40);
    titleLbl.text = @"股票";
    titleLbl.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.2];
    titleLbl.font = [UIFont systemFontOfSize:12];
    titleLbl.textAlignment = NSTextAlignmentCenter;
    [headerView addSubview:titleLbl];
    
    self.headerScrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(lblW, 0, self.view.bounds.size.width-lblW, 40)];
    self.headerScrollview.showsVerticalScrollIndicator = NO;
    self.headerScrollview.showsHorizontalScrollIndicator = NO;
    self.headerScrollview.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.2];
    
    NSArray *topArr = @[@"估算净值", @"估算涨幅", @"最新净值", @"日涨幅", @"操作"];
    CGFloat labelW = self.view.bounds.size.width / 5;
    [topArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UILabel *label = [UILabel new];
        label.frame = CGRectMake(labelW * idx, 0, labelW, 40);
        label.text = topArr[idx];
        label.font = [UIFont systemFontOfSize:12];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self.headerScrollview addSubview:label];
    }];
    self.headerScrollview.contentSize = CGSizeMake(lblW * topArr.count, 0);
    self.headerScrollview.delegate = self;
    
    [headerView addSubview:self.headerScrollview];
    
    return headerView;

}

#pragma mark -
#pragma mark - UIScrollViewDelegate
#pragma mark-- UIScrollViewDelegate
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    
//    if ([scrollView isEqual:self.headerScrollview]) {
//        CGPoint offSet = _aroundCell.rightScrollView.contentOffset;
//        offSet.x = scrollView.contentOffset.x;
//        _aroundCell.rightScrollView.contentOffset = offSet;
//    }
//    if ([scrollView isEqual:self.tableView]) {
//        // 发送通知
//        [[NSNotificationCenter defaultCenter] postNotificationName:tapCellScrollNotification object:self userInfo:@{@"cellOffX":@(self.cellLastX)}];
//    }
//    
//}
//
//-(void)scrollMove:(NSNotification*)notification{
//    NSDictionary *noticeInfo = notification.userInfo;
//    NSObject *obj = notification.object;
//    float x = [noticeInfo[@"cellOffX"] floatValue];
//    self.cellLastX = x;
//    CGPoint offSet = self.topScrollView.contentOffset;
//    offSet.x = x;
//    self.topScrollView.contentOffset = offSet;
//    obj = nil;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
