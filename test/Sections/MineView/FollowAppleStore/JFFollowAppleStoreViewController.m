//
//  JFFollowAppleStoreViewController.m
//  test
//
//  Created by je_ffy on 2017/5/22.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFFollowAppleStoreViewController.h"

@interface JFFollowAppleStoreViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIScrollView *baseScrollView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *headerView;

@end

@implementation JFFollowAppleStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    [self.view addSubview:self.baseScrollView];
    _headerView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, FULL_SCREEN_WIDTH, 100)];
    [_headerView sd_setImageWithURL:[NSURL URLWithString:@"http://s13.mogujie.cn/b7/bao/131012/vud8_kqywordekfbgo2dwgfjeg5sckzsew_310x426.jpg_200x999.jpg"]];
    _headerView.backgroundColor = [UIColor yellowColor];

    [self.baseScrollView addSubview:_headerView];
    [self.view addSubview:self.tableView];
    
    [self.tableView setContentInset:UIEdgeInsetsMake(100, 0, 0, 0)];
    

}

- (UIScrollView *)baseScrollView {
    if (!_baseScrollView) {
        UIScrollView *baseScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, FULL_SCREEN_WIDTH, 100)];
        baseScrollView.delegate = self;
        baseScrollView.layer.borderWidth = 0.50f;
        baseScrollView.layer.borderColor = [UIColor redColor].CGColor;
        baseScrollView.contentSize = CGSizeMake(FULL_SCREEN_WIDTH, FULL_SCREEN_HEIGHT);
        [self.view addSubview:_baseScrollView = baseScrollView];
    }
    
    return _baseScrollView;
}

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, FULL_SCREEN_WIDTH, FULL_SCREEN_HEIGHT - 64) style:UITableViewStyleGrouped];
        tableView.backgroundColor = [UIColor clearColor];
        tableView.delegate = self;
        tableView.dataSource = self;
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        tableView.layer.borderWidth = 0.50f;
        tableView.layer.borderColor = [UIColor redColor].CGColor;
        [self.view addSubview:_tableView = tableView];
    }
    
    return _tableView;
}

#pragma mark -
#pragma mark - UITableViewDelegate && UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld - %ld",indexPath.section,indexPath.row];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, FULL_SCREEN_WIDTH, 44)];
    view.backgroundColor = [UIColor redColor];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 44.0f;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    CGFloat yOffest = scrollView.contentOffset.y;
    if ([scrollView isKindOfClass:[UITableView class]]) {
        if (scrollView.contentOffset.y > -100.0f && scrollView.contentOffset.y < 0.0f) {

            CGPoint offSet = _baseScrollView.contentOffset;
            offSet.y =  100 + yOffest;
            _baseScrollView.contentOffset = offSet;
            
        }else {
            _baseScrollView.contentOffset = CGPointMake(0, 0);

        }

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
