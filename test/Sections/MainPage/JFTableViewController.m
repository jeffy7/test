//
//  JFTableViewController.m
//  test
//
//  Created by je_ffy on 16/3/27.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "JFTableViewController.h"
#import "JFTableViewCell.h"
#import "UIButton+SPBadge.h"
#import "JFCycleView.h"

@interface JFTableViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) JFCycleView *cycleView;

@end

@implementation JFTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = [[NSMutableArray alloc] init];

//    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//
//        [self performSelector:@selector(refreshEnding) withObject:self afterDelay:3.0f];
//    }];
//    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
//        [self performSelector:@selector(nextPageEnding) withObject:self afterDelay:3.0f];
//    }];

    
    self.cycleView.frame = CGRectMake(50, 50, 100, 100);
    self.cycleView.layer.borderWidth = 0.50f;
    self.cycleView.layer.borderColor = [UIColor redColor].CGColor;
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [_cycleView scrollDidScroll:scrollView];
    
}
- (JFCycleView *)cycleView {
    if (!_cycleView) {
        JFCycleView *cycleView = [[JFCycleView alloc] init];
        [self.view addSubview:_cycleView = cycleView];
    }
    return _cycleView;
}
- (void)refreshEnding {
//    [self.tableView.mj_header endRefreshing];
}

- (void)nextPageEnding {
//    [self.tableView.mj_footer endRefreshing];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JFTableViewCell"];
    cell.dataArray = _dataArray;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.name.text = @"just do it !";
    
    return cell;
}


@end
