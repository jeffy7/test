//
//  JFTableViewController.m
//  test
//
//  Created by je_ffy on 16/3/27.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "JFTableViewController.h"
#import "JFTableViewCell.h"
#import "UIButton+Badge.h"
#import "MJRefresh.h"

@interface JFTableViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) UIButton *button ;

@end

@implementation JFTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = [[NSMutableArray alloc] init];
    
    _button = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 50, 50)];
    _button.badge = @"10";
    _button.layer.borderWidth = 0.50f;
    _button.layer.borderColor = [UIColor redColor].CGColor;
    [_button setTitle:@"button" forState:UIControlStateNormal];
    [self.view addSubview:_button];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{

        [self performSelector:@selector(refreshEnding) withObject:self afterDelay:3.0f];
    }];
    self.tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self performSelector:@selector(nextPageEnding) withObject:self afterDelay:3.0f];
    }];

    
}

- (void)refreshEnding {
    [self.tableView.mj_header endRefreshing];
}

- (void)nextPageEnding {
    [self.tableView.mj_footer endRefreshing];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    _button.badge = [NSString stringWithFormat:@"1111111111%ld",indexPath.row];
}



@end
