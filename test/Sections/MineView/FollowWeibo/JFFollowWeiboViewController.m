//
//  JFFollowWeiboViewController.m
//  test
//
//  Created by je_ffy on 2017/5/10.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFFollowWeiboViewController.h"
#import "JFFollowWeiboCollectionReusableView.h"

@interface JFFollowWeiboViewController () <UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UICollectionViewFlowLayout *layout;


@end

@implementation JFFollowWeiboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.collectionView];
}

- (UICollectionViewFlowLayout *)layout {
    if (!_layout) {
        _layout = [[UICollectionViewFlowLayout alloc] init];
        _layout.sectionInset = UIEdgeInsetsMake(0, 0, 10, 0);
        _layout.minimumInteritemSpacing = 0.0f;
        _layout.minimumLineSpacing = 0.0f;
        _layout.scrollDirection  = UICollectionViewScrollDirectionHorizontal;
        _layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 44);
    }
    
    return _layout;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, FULL_SCREEN_WIDTH, FULL_SCREEN_HEIGHT) collectionViewLayout:self.layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"test"];
        [_collectionView registerClass:[JFFollowWeiboCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
        _collectionView.pagingEnabled = YES;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    
    return _collectionView;
}

#pragma mark -
#pragma mark - UICollectionViewDelegate && UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 5;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"test" forIndexPath:indexPath];
    cell.layer.borderWidth = 0.50f;
    cell.layer.borderColor = [UIColor redColor].CGColor;
    if (indexPath.row % 2 != 0) {
        cell.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.2];
    }else {
        cell.backgroundColor = [UIColor whiteColor];
    }
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake(FULL_SCREEN_WIDTH,50) ;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {

        JFFollowWeiboCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
        headerView.frame = CGRectMake(0, 0, FULL_SCREEN_WIDTH, 44);
        headerView.backgroundColor =[UIColor orangeColor];
//        headerView.titleLabel.text = @"title";
        return headerView;
    }else{

        return nil;
    }
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
