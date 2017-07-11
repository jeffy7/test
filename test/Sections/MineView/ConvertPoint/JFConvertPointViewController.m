//
//  JFConvertPointViewController.m
//  test
//
//  Created by je_ffy on 2017/6/6.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFConvertPointViewController.h"

@interface JFConvertPointViewController ()

@end

@implementation JFConvertPointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(0, 50+64, 200, 200)];
    redView.backgroundColor = [UIColor redColor];
    [self.view addSubview:redView];
    
    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, 50, 50)];
    blueView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:blueView];
    
    UIView *grayView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    grayView.backgroundColor = [UIColor grayColor];
    [redView addSubview:grayView];
    
    // Do any additional setup after loading the view.
    
    //1.坐标系转换convertPoint
    //获取grayView在self.view坐标系中的坐标（以下两种写法等效）:***********************************
    //理解，父视图转换姿势图在目标视图上的坐标，其中 redView 是 grayView 的父视图，转换的结果是 grayView 在self.view 上的坐标
    CGPoint redCenterInView = [redView convertPoint:grayView.frame.origin toView:self.view];
    
    //理解，目标视图转换子视图上的坐标从子视图，其中 redView 是 grayView 的父视图，转换的结果是 grayView 在self.view 上的坐标
    CGPoint redCenterInView1 = [self.view convertPoint:grayView.frame.origin fromView:redView];
    
    NSLog(@"redCenterInView.x= %lf,redCenterInView.y = %lf",redCenterInView.x,redCenterInView.y);
    NSLog(@"redCenterInView1.x= %lf,redCenterInView1.y = %lf",redCenterInView1.x,redCenterInView1.y);
    
    //使用注意：
    //1.使用convertPoint:toView:时，调用者应为covertPoint的父视图。即调用者应为point的父控件。toView即为需要转换到的视图坐标系，以此视图的左上角为（0，0）点。
    //2.使用convertPoint:fromView:时正好相反，调用者为需要转换到的视图坐标系。fromView为point所在的父控件。
    //3.toView可以为nil。此时相当于toView传入self.view.window
    
    //补充：有人问道为什么相对于self.view 和相对于self.view.window 不一样呢？
    //因为在viewDidLoad方法中，self.view.window为nil，测试的时候注意不要直接写在viewDidLoad方法中，写在viewdidAppear中。
    
    //2.点在范围内的判断
    //UIView有如下一个方法，用于判断点是否在内部
    //-(BOOL)pointInside:(CGPoint)point withEvent:(nullable UIEvent *)event;   // default returns YES if point is in bounds
    
    
    
    
    //比如确定 grayView 的中心点是否在 blueView 和 redView 上：
    
    //转换为blueView坐标系点
    CGPoint grayCenterInBlueView = [redView convertPoint:grayView.center toView:blueView];
    BOOL isBlueInside = [blueView pointInside:grayCenterInBlueView withEvent:nil];
    
    NSLog(@"isBlueInside = %d",isBlueInside);
    NSLog(@"grayCenterInBlueView.x= %lf,grayCenterInBlueView.y = %lf",grayCenterInBlueView.x,grayCenterInBlueView.y);

    
    //转换为redView坐标系点
    CGPoint grayCenterInRedView = [redView convertPoint:grayView.center toView:redView];
    BOOL isRedInside = [blueView pointInside:grayCenterInRedView withEvent:nil];
    
    NSLog(@"isRedInside = %d",isRedInside);
    NSLog(@"grayCenterInRedView.x= %lf,grayCenterInRedView.y = %lf",grayCenterInRedView.x,grayCenterInRedView.y);

    //使用注意：
    //point必须为调用者的坐标系，即调用者的左上角为（0，0）的坐标系。
    
    
    
//    UIImage *red_touch_button = [UIImage imageNamed:@"new_red_button_highlight"];
//    red_touch_button = [red_touch_button stretchableImageWithLeftCapWidth:floorf(red_touch_button.size.width/2) topCapHeight:floorf(red_touch_button.size.height/2)];
//    [_loginBtn setBackgroundImage:red_touch_button forState:UIControlStateHighlighted];
//    [_loginBtn addTarget:self action:@selector(checkLoginUserInfo) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:_loginBtn];

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
