//
//  JFMasonryViewController.m
//  test
//
//  Created by je_ffy on 2017/6/11.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFMasonryViewController.h"
#import "JFMasonryLayout.h"
#import "JFMasonryCollectionViewCell.h"
#import "JFMasonryModel.h"

@interface JFMasonryViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) JFMasonryLayout *layout;
@property (nonatomic, strong) NSMutableArray *daraArray;

@end

@implementation JFMasonryViewController

- (id)init {
    if (self = [super init]) {
        _daraArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    JFMasonryModel *model1 = [[JFMasonryModel alloc] init];
    model1.salePrice = @"45435235";
    model1.priceDesc = @"18000";
    model1.goldStr = @"";
    
    JFMasonryModel *model2 = [[JFMasonryModel alloc] init];
    model2.salePrice = @"190000";
    model2.priceDesc = @"";
    model2.goldStr = @"金牌优惠";
    
    JFMasonryModel *model3 = [[JFMasonryModel alloc] init];
    model3.salePrice = @"1900";
    model3.priceDesc = @"1800000";
    model3.goldStr = @"";
    
    JFMasonryModel *model4 = [[JFMasonryModel alloc] init];
    model4.salePrice = @"1900000";
    model4.priceDesc = @"";
    model4.goldStr = @"金牌优惠";
    
    JFMasonryModel *model5 = [[JFMasonryModel alloc] init];
    model5.salePrice = @"12900";
    model5.priceDesc = @"";
    model5.goldStr = @"金牌优惠";
    JFMasonryModel *model11 = [[JFMasonryModel alloc] init];
    model11.salePrice = @"71900";
    model11.priceDesc = @"1800";
    model11.goldStr = @"";
    
    JFMasonryModel *model12 = [[JFMasonryModel alloc] init];
    model12.salePrice = @"19090";
    model12.priceDesc = @"";
    model12.goldStr = @"金牌优惠";
    
    JFMasonryModel *model13 = [[JFMasonryModel alloc] init];
    model13.salePrice = @"16900";
    model13.priceDesc = @"18700";
    model13.goldStr = @"";
    
    JFMasonryModel *model14 = [[JFMasonryModel alloc] init];
    model14.salePrice = @"154900";
    model14.priceDesc = @"";
    model14.goldStr = @"金牌优惠";
    
    JFMasonryModel *model15 = [[JFMasonryModel alloc] init];
    model15.salePrice = @"19070";
    model15.priceDesc = @"";
    model15.goldStr = @"金牌优惠";
    
    
    [_daraArray addObject:model1];
    [_daraArray addObject:model2];
    [_daraArray addObject:model3];
    [_daraArray addObject:model4];
    [_daraArray addObject:model5];
    [_daraArray addObject:model11];
    [_daraArray addObject:model12];
    [_daraArray addObject:model13];
    [_daraArray addObject:model14];
    [_daraArray addObject:model15];

    [self.view addSubview:self.collectionView];
    [self.collectionView reloadData];
}

- (JFMasonryLayout *)layout {
    if (!_layout) {
        _layout = [[JFMasonryLayout alloc] init];
        _layout.minimumInteritemSpacing = 0.0f;
        _layout.minimumLineSpacing = 0.0f;
        _layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    
    return _layout;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, FULL_SCREEN_WIDTH, FULL_SCREEN_HEIGHT - 64) collectionViewLayout:self.layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[JFMasonryCollectionViewCell class] forCellWithReuseIdentifier:@"JFMasonryCollectionViewCell"];
    }
    
    return _collectionView;
}

#pragma mark -
#pragma mark - UICollectionViewDelegate && UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _daraArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JFMasonryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JFMasonryCollectionViewCell" forIndexPath:indexPath];
    cell.layer.borderWidth = 0.50f;
    cell.layer.borderColor = [UIColor redColor].CGColor;
    cell.model = _daraArray[indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(FULL_SCREEN_WIDTH/2, 250);
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
