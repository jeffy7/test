//
//  JFMineviewController.m
//  test
//
//  Created by je_ffy on 16/8/24.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "JFMineviewController.h"
#import "JFReactiveCocoaViewController.h"
//
#import "JFSDCycleViewController.h"
#import "JFRounderCornerViewController.h"
#import "JFCoreAnimationViewController.h"
#import "JFFontViewController.h"
#import "JFArchiveViewController.h"
#import "JFFollowWeiboViewController.h"
#import "JFFollowStockViewController.h"
#import "JFFollowTuhaoViewController.h"

@interface JFMineviewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *titles;
@property (nonatomic, strong) NSMutableArray *classNames;
@property (weak, nonatomic) UITableView *tableView;

@end

@implementation JFMineviewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.titles = @[].mutableCopy;
    self.classNames = @[].mutableCopy;
    
    [self addTitle:@"Test" class:@""];
    [self addTitle:@"SDCycleCollectionView" class:@"JFSDCycleViewController"];
    [self addTitle:@"ReactiveCocoa" class:@"JFReactiveCocoaViewController"];
    [self addTitle:@"RounderCorner" class:@"JFRounderCornerViewController"];
    [self addTitle:@"Animation" class:@"JFCoreAnimationViewController"];
    [self addTitle:@"FontFamily" class:@"JFFontViewController"];
    [self addTitle:@"Archive&&UnArchive" class:@"JFArchiveViewController"];
    [self addTitle:@"仿微博" class:@"JFFollowWeiboViewController"];
    [self addTitle:@"仿股票" class:@"JFFollowStockViewController"];
    [self addTitle:@"瀑布流" class:@"JFCascadeViewController"];
    [self addTitle:@"Apple Store 首页" class:@"JFFollowAppleStoreViewController"];
    [self addTitle:@"Demo" class:@"JFFollowTuhaoViewController"];
    [self addTitle:@"ConvertPoint" class:@"JFConvertPointViewController"];
    
    self.view.backgroundColor = [UIColor yellowColor];
    [self.tableView reloadData];
}

- (void)addTitle:(NSString *)title class:(NSString *)className {
    [self.titles addObject:title];
    [self.classNames addObject:className];
}

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        tableView.delegate = self;
        tableView.dataSource = self;
        [self.view addSubview:_tableView = tableView];
    }
    
    return _tableView;
}

#pragma mark -
#pragma mark - UITableViewDelegate && UITableViewDataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    cell.textLabel.text = _titles[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return _titles.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = self.classNames[indexPath.row];
    Class class = NSClassFromString(className);
    if (class) {
        UIViewController *ctrl = class.new;
        ctrl.title = _titles[indexPath.row];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
}

@end
