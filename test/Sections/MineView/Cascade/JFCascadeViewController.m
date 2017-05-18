//
//  JFCascadeViewController.m
//  test
//
//  Created by je_ffy on 2017/5/18.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFCascadeViewController.h"
#import "JFCustomCollectionViewLayout.h"
#import "JFCustomCollectionViewCell.h"
#import "NSObject+MJKeyValue.h"
#import "JFCascadeProduct.h"

@interface JFCascadeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,JFCustomCollectionViewLayoutDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) JFCustomCollectionViewLayout *layout;
@property (nonatomic, strong) NSMutableArray *daraArray;

@end

@implementation JFCascadeViewController

- (id)init {
    if (self = [super init]) {
        _daraArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
    NSMutableArray *array = [JFCascadeProduct mj_objectArrayWithFilename:@"1.plist"];
    [_daraArray addObjectsFromArray:array];
    
    [self.view addSubview:self.collectionView];
}


- (JFCustomCollectionViewLayout *)layout {
    if (!_layout) {
        _layout = [[JFCustomCollectionViewLayout alloc] init];
        //_layout.sectionInset = UIEdgeInsetsMake(0, 0, 10, 0);
        //_layout.minimumInteritemSpacing = 0.0f;
        //_layout.minimumLineSpacing = 0.0f;
        //_layout.scrollDirection  = UICollectionViewScrollDirectionVertical;
    }
    
    return _layout;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, FULL_SCREEN_WIDTH, FULL_SCREEN_HEIGHT - 64) collectionViewLayout:self.layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        [_collectionView registerClass:[JFCustomCollectionViewCell class] forCellWithReuseIdentifier:@"test"];
        //_collectionView.pagingEnabled = YES;
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _layout.delegate = self;
    }
    
    return _collectionView;
}

#pragma mark -
#pragma mark - UICollectionViewDelegate && UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return _daraArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JFCustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"test" forIndexPath:indexPath];
    cell.product = _daraArray[indexPath.row];
    cell.indexLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    
    return cell;
}

- (CGFloat)cascadeFlowLayout:(JFCustomCollectionViewLayout *)cascadeFlowLayout heightForRowAtIndexPath:(NSInteger)index itemWidth:(CGFloat)itemWidth {
    JFCascadeProduct *product = self.daraArray[index];
    
    return itemWidth * product.h / product.w;
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
