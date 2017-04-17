//
//  JFTabBarViewController.m
//  test
//
//  Created by je_ffy on 2017/3/7.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFTabBarViewController.h"

@interface JFTabBarViewController ()

@property (nonatomic,strong) UIWindow *coverWindow;

@end

@implementation JFTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.8 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        _coverWindow =[[UIWindow alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20)];
        _coverWindow.layer.borderWidth = 0.50f;
        _coverWindow.layer.borderColor = [UIColor redColor].CGColor;
        _coverWindow.hidden = NO;
        _coverWindow.backgroundColor = [UIColor clearColor];
        _coverWindow.windowLevel = UIWindowLevelStatusBar + 1;//优先级比statusbar高一点,盖住statusbar
        //添加手势
        UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(tapWindowScrollsToTop)];
        swipe.direction = UISwipeGestureRecognizerDirectionLeft;
        [_coverWindow addGestureRecognizer:swipe];
        [_coverWindow makeKeyAndVisible];//让window变成主window,并显示出来
        [window makeKeyWindow];//把原来的window在变成主window
    });
    
}

- (void)tapWindowScrollsToTop {
    //[CCLogSystem activeDeveloperUI];
    
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
