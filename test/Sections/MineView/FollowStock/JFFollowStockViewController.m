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
