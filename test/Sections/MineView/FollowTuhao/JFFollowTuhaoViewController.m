//
//  JFFollowTuhaoViewController.m
//  test
//
//  Created by je_ffy on 2017/5/23.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFFollowTuhaoViewController.h"


NSString * const identifireeee = @"stockCell";

@interface JFFollowTuhaoViewController ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *tableViewHeader;
@property (nonatomic, strong) UIImageView *imageView;


@end

@implementation JFFollowTuhaoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [self.view addSubview:self.tableView];
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, FULL_SCREEN_WIDTH, 200)];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:@"http://s13.mogujie.cn/b7/bao/131012/vud8_kqywordekfbgo2dwgfjeg5sckzsew_310x426.jpg_200x999.jpg"]];
    _imageView.contentMode = UIViewContentModeScaleToFill;
    [self.tableViewHeader addSubview:self.imageView];
    self.tableView.tableHeaderView = self.tableViewHeader;
    // Do any additional setup after loading the view.
    
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifireeee];
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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifireeee];
    if (indexPath.row % 2 != 0) {
        cell.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.2];
    } else {
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return 44;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, FULL_SCREEN_WIDTH, 44)];
    headerView.backgroundColor = [UIColor redColor];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(FULL_SCREEN_WIDTH - 44, 0, 44, 44)];
    [button addTarget:self action:@selector(changeStyle) forControlEvents:UIControlEventTouchUpInside];
    button.layer.borderWidth = 0.50f;
    button.layer.borderColor = [UIColor blackColor].CGColor;
    [headerView addSubview:button];
    
    return headerView;
}

- (void)changeStyle {
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"indexPath = %ld",(long)indexPath.row);
}

#pragma mark -
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    if (offset.y < 0) {
        CGRect rect =self.tableViewHeader.frame;
        rect.origin.y = offset.y;
        rect.size.height =CGRectGetHeight(rect)-offset.y;
        self.imageView.frame = rect;
        self.tableViewHeader.clipsToBounds=NO;
    }
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
