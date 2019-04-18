//
//  JFScrollViewAnimationViewController.m
//  test
//
//  Created by je_ffy on 2018/12/14.
//  Copyright © 2018年 je_ffy. All rights reserved.
//

#import "JFScrollViewAnimationViewController.h"
#import "JFScrollAnimationView.h"

#define BaseTag 10
/**
 动画偏移量 是指rightView相对于leftView的偏移量
 */
#define AnimationOffset   0

@interface JFScrollViewAnimationViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation JFScrollViewAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - NaviBarHeight - StatusHeighe)];
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.contentSize = CGSizeMake(ScreenWidth*4 , ScreenHeight - NaviBarHeight - StatusHeighe);
    
    for(int i = 0; i < 4;i++) {
        
        JFScrollAnimationView * animitionImageView = [[JFScrollAnimationView alloc] initWithFrame:CGRectMake(ScreenWidth*i, 0, ScreenWidth, ScreenHeight - NaviBarHeight - StatusHeighe)];
        animitionImageView.imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]];
        [_scrollView addSubview:animitionImageView];
        animitionImageView.tag = BaseTag + i;
    }
    [self.view addSubview:_scrollView];

    // Do any additional setup after loading the view.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat x = scrollView.contentOffset.x;
    NSLog(@"%lf",x);
    
    

    NSInteger leftIndex = x/ScreenWidth;
//    NSLog(@"%ld",leftIndex);

    //这里的left和right是区分拖动中可见的两个视图
    JFScrollAnimationView * leftView = [scrollView viewWithTag:(leftIndex + BaseTag)];
    JFScrollAnimationView * rightView = [scrollView viewWithTag:(leftIndex + 1 + BaseTag)];
    

    leftView.contentX = ((ScreenWidth - AnimationOffset) + (x - ((leftIndex + 1) * ScreenWidth))/ScreenWidth * (ScreenWidth - AnimationOffset));
    rightView.contentX = -(ScreenWidth - AnimationOffset) + (x - (leftIndex * ScreenWidth))/ScreenWidth * (ScreenWidth - AnimationOffset);
    NSLog(@"contentOffset.x = %lf   ---  leftView.contentX =%lf   --------    rightView.contentX =%lf ",x,leftView.contentX,rightView.contentX);

//    leftView.contentX = -(ScreenWidth - x + (leftIndex * ScreenWidth));
//    rightView.contentX = (ScreenWidth + x - ((leftIndex + 1) * ScreenWidth));

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
