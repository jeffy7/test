//
//  JFCoreAnimationViewController.m
//  test
//
//  Created by je_ffy on 2017/3/8.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFCoreAnimationViewController.h"

@interface JFCoreAnimationViewController ()

@property (nonatomic,strong) UIView *demoView;

@end

@implementation JFCoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *titles = @[@"淡入淡出",@"缩放",@"旋转",@"平移"];
    for (unsigned int i = 0; i < titles.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10 + (70)*i, 74 , 60, 50);
        button.backgroundColor = [UIColor redColor];
        button.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        button.tag = i;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(dosomeThing:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }

    _demoView = [[UIView  alloc] init];
    _demoView.backgroundColor =[UIColor redColor];
    [self.view addSubview:_demoView];
    
    [_demoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.equalTo(@100);
    }];
    // Do any additional setup after loading the view.
}

- (void)dosomeThing:(UIButton *)sender {
//    CABasicAnimation *animation = nil;
//    switch (sender.tag) {
//        case 0:{
//            //淡如淡出
//            animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
//            [animation setFromValue:@1.0];
//            [animation setToValue:@0.1];
//        }break;
//        case 1:{
//            //缩放
//            animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//            [animation setFromValue:@1.0];//设置起始值
//            [animation setToValue:@0.1];//设置目标值
//        }break;
//        case 2:{
//            //旋转
//            animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
//            //setFromValue不设置,默认以当前状态为准
//            [animation setToValue:@(M_PI)];
//        }break;
//        case 3:{
//            //平移
//            animation = [CABasicAnimation animationWithKeyPath:@"position"];
//            //setFromValue不设置,默认以当前状态为准
//            [animation setToValue:[NSValue valueWithCGPoint:CGPointMake(self.view.center.x, self.view.center.y + 200)]];
//        }break;
//        default:break;
//    }
    
    CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat: M_PI];
    rotateAnimation.autoreverses = YES;
    rotateAnimation.repeatCount = 1;
    rotateAnimation.duration = 2;
    [rotateAnimation setAutoreverses:NO];

    [_demoView.layer addAnimation:rotateAnimation forKey:@"test"];

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
