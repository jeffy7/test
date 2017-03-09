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
@property (nonatomic, strong) UIButton *stopAnimationButton;

@end

@implementation JFCoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.stopAnimationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.view).offset(-10);
        make.width.height.equalTo(@60);
    }];
    
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

- (UIButton *)stopAnimationButton {
    if (!_stopAnimationButton) {
        _stopAnimationButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _stopAnimationButton.backgroundColor = [UIColor blueColor];
        [_stopAnimationButton setTitle:@"Stop" forState:UIControlStateNormal];
        [_stopAnimationButton addTarget:self action:@selector(stopAnimation) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_stopAnimationButton];
    }
    
    return _stopAnimationButton;
}

- (void)stopAnimation {
    [_demoView.layer removeAllAnimations];
}

- (void)dosomeThing:(UIButton *)sender {
//    CABasicAnimation *animation = nil;
    switch (sender.tag) {
        case 0:{
            //淡如淡出
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
            animation.fromValue = [NSNumber numberWithFloat:1.0];
            animation.toValue = [NSNumber numberWithFloat: 0.0];
            animation.autoreverses = YES;//
            animation.repeatCount = MAXFLOAT;//MAXFLOAT
            animation.duration = 3.0f;
            
            [_demoView.layer addAnimation:animation forKey:@"test"];
        }break;
        case 1:{
            //缩放
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
            animation.fromValue = [NSNumber numberWithFloat:1.0f];
            animation.toValue = [NSNumber numberWithFloat:2.0f];
            animation.autoreverses = YES;
            animation.repeatCount = MAXFLOAT;
            animation.duration = 3.0f;
            [_demoView.layer addAnimation:animation forKey:@"scale"];
        }break;
        case 2:{
            //旋转
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
            animation.fromValue = [NSNumber numberWithFloat:0.0];//setFromValue不设置,默认以当前状态为准
            animation.toValue = [NSNumber numberWithFloat: M_PI];
            animation.autoreverses = YES;
            animation.repeatCount = MAXFLOAT;
            animation.duration = 3.0f;
            
            [_demoView.layer addAnimation:animation forKey:@"test"];
        }break;
        case 3:{
            //平移
//            animation = [CABasicAnimation animationWithKeyPath:@"position"];
            CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
            animation.toValue = [NSValue valueWithCGPoint:CGPointMake(_demoView.center.x, _demoView.center.y +200)];
            animation.repeatCount = MAXFLOAT;
            animation.autoreverses = YES;
            animation.duration = 3.0f;
            [_demoView.layer addAnimation:animation forKey:@"position"];
            
        }break;
        default:break;
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
