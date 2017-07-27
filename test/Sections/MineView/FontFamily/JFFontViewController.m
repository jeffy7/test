//
//  JFFontViewController.m
//  test
//
//  Created by je_ffy on 2017/3/9.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFFontViewController.h"

@interface JFFontViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate>
@property (nonatomic, strong) NSMutableArray *dataArray;
@property (nonatomic, strong) NSMutableArray *filterArray;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation JFFontViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _searchBar = [[UISearchBar alloc] init];
    _searchBar.placeholder = @"Search  Fonts";
    _searchBar.barStyle = UIBarStyleDefault;
    //    searchBar.showsSearchResultsButton = YES;
    
    _searchBar.showsScopeBar = YES;
    _searchBar.selectedScopeButtonIndex = 2;
    _searchBar.delegate = self;
    
    [self.view addSubview:_searchBar];
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.right.equalTo(self.view);
        make.height.equalTo(@44);
    }];
    
    _dataArray = [[NSMutableArray alloc] init];
    _filterArray = [[NSMutableArray alloc] init];
    for (NSString *familyName in [UIFont familyNames]) {
        for (NSString * fontName in [UIFont fontNamesForFamilyName:familyName]) {
            [self.dataArray addObject:fontName];
            [self.filterArray addObject:fontName];
        }
    }
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_searchBar.mas_bottom);
        make.left.right.equalTo(_searchBar);
        make.height.equalTo(@200);
    }];
    [self.tableView reloadData];
    
    _label = [[UILabel alloc] init];
    _label.font = [UIFont systemFontOfSize:14.0f];
    _label.numberOfLines = 0;
    _label.text = @" 1.苹果设备的标准配备屡获殊荣的辅助功能，让残疾人体验一切苹果iPhone、iPad，人们看，iPod的触摸，和Mac所提供的。与访问API在iOS、MacOS和WatchOS，你可以让你的应用程序无缝集成功能为范围广泛的用户。\n\n 2.Apple devices come standard with award-winning accessibility features that let people with disabilities experience everything Apple Watch, iPhone, iPad, iPod touch, and Mac have to offer. And with accessibility APIs in iOS, macOS, and watchOS, you can make your apps seamlessly functional for a broad range of users. \n\n 3.学习如何利用现有的和新的UIAccessibility API iOS，包括为视力较差的用户扩展的支持，以确保您的应用程序的功能是提供给所有用户。了解如何添加支持的画外音，开关控制，自动化和其他辅助技术的客户和你的MacOS应用工作。学习先进的技术，使复杂的控件只使用几行代码访问。\n\n 4.Learn how to leverage existing and new UIAccessibility APIs in iOS, including expanded support for low vision users, to ensure that your app's features are available to all users. Discover how to add support for VoiceOver, Switch Control, automation and other assistive-technology clients to work with your macOS applications. Learn advanced techniques to make complex controls accessible with only a few lines of code. ";
    _label.layer.borderWidth = 0.50f;
    _label.layer.borderColor = [UIColor blackColor].CGColor;
    [self.scrollView addSubview:_label];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_tableView.mas_bottom).offset(20);
        make.left.right.bottom.equalTo(self.view);
    }];
    [self calculateHeightWith:[UIFont systemFontOfSize:14.0f]];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)calculateHeightWith:(UIFont *)font {
    CGRect rect = [_label.text boundingRectWithSize:CGSizeMake(self.view.frame.size.width - 20, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:font} context:nil];
    _label.frame = CGRectMake(10, 10, self.view.frame.size.width - 20, rect.size.height);
    
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width, rect.size.height + 20);
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.layer.borderWidth = 0.50f;
        _tableView.layer.borderColor = [UIColor redColor].CGColor;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.layer.borderWidth = 0.50f;
        _scrollView.layer.borderColor = [UIColor redColor].CGColor;
        [self.view addSubview:_scrollView];
    }
    
    return _scrollView;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell.textLabel.text = _filterArray[indexPath.row];
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return  [_filterArray count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [_searchBar resignFirstResponder];
    _label.font = [UIFont fontWithName:_filterArray[indexPath.row] size:14.0f];
    [self calculateHeightWith:_label.font];
}

#pragma mark -
#pragma mark -
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar {
    
    return YES;
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:YES animated:YES];
}

- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    
    return YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self contains[cd] %@",searchText];
    NSArray *result = [_dataArray filteredArrayUsingPredicate:predicate];
    
    [_filterArray removeAllObjects];
    if ([searchText isEqualToString:@""]) {
        [_filterArray addObjectsFromArray:_dataArray];
    }
    [_filterArray addObjectsFromArray:result];
    [self.tableView setContentOffset:CGPointZero];
    [self.tableView reloadData];
    
    
}
//每编辑一次  就执行的方法,可以输出当前字符串的下标,即当前文本
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    return YES;
}

//点击searchbar  执行的方法
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar setShowsCancelButton:NO animated:YES];
    //取消第一响应者
    [searchBar resignFirstResponder];
    
    NSLog(@"%s",__FUNCTION__);
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar {
    
    [searchBar resignFirstResponder];
    searchBar.showsCancelButton = NO;
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
