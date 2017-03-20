//
//  JFCAKeyframeAnimationViewController.m
//  test
//
//  Created by je_ffy on 2017/3/20.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFCAKeyframeAnimationViewController.h"

@interface JFCAKeyframeAnimationViewController ()

@property (nonatomic,strong) UIView *demoView;
@property (nonatomic, strong) UIButton *stopAnimationButton;

@end

@implementation JFCAKeyframeAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.stopAnimationButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.view).offset(-10);
        make.bottom.equalTo(self.view).offset(-10);
        make.width.height.equalTo(@60);
    }];
    
    NSArray *titles = @[@"贝塞尔直线",
                        @"贝塞尔椭圆",
                        @"贝塞尔圆",
                        @"贝塞尔矩形",
                        @"贝塞尔抛物线"];
    for (unsigned int i = 0; i < titles.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10 , 70 + (30)*i , 100, 25);
        button.backgroundColor = [UIColor redColor];
        button.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        button.tag = i;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(dosomeThing:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
    
    _demoView = [[UIView  alloc] init];
    _demoView.backgroundColor =[UIColor redColor];
    _demoView.layer.cornerRadius = 25.0f;
    _demoView.layer.masksToBounds = YES;
    [self.view addSubview:_demoView];
    
    [_demoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.equalTo(@50);
    }];
    
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
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    switch (sender.tag) {
        case 0:{
            //直线
            UIBezierPath *path = [[UIBezierPath alloc] init];
            [path moveToPoint:CGPointMake(200, 64)];
            [path addLineToPoint:CGPointMake(200, 400)];

            [animation setPath:path.CGPath];

        }break;
        case 1:{
            //贝塞尔圆
            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 200, 200, 100)];
            [animation setPath:path.CGPath];
            
        }break;
        case 2:{
            //贝塞尔圆
            UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 200, 200, 200)];
            [animation setPath:path.CGPath];
            
        }break;
        case 3:{
            //矩形
            UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(200, 200, 200, 200)];
            [animation setPath:path.CGPath];
            
        }break;
        case 4:{
            //贝塞尔抛物线
            UIBezierPath *path = [UIBezierPath bezierPath];
            [path moveToPoint:CGPointMake(FULL_SCREEN_WIDTH/2, FULL_SCREEN_HEIGHT/2)];//起点
            [path addQuadCurveToPoint:CGPointMake(FULL_SCREEN_WIDTH ,64)
                         controlPoint:CGPointMake(FULL_SCREEN_HEIGHT/2, 0)];
            [animation setPath:path.CGPath];
        }break;
        default:break;
    }
    
    [animation setDuration:3.5];
    [animation setRemovedOnCompletion:NO];
    [animation setFillMode:kCAFillModeBoth];
    [self.demoView.layer addAnimation:animation forKey:nil];

    
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
