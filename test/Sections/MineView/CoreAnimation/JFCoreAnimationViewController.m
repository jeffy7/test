//
//  JFCoreAnimationViewController.m
//  test
//
//  Created by je_ffy on 2017/3/8.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFCoreAnimationViewController.h"
#import "JFCABaseAnimationViewController.h"
#import "JFCAKeyframeAnimationViewController.h"


@interface JFCoreAnimationViewController ()

@end

@implementation JFCoreAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray *titles = @[@"基本动画（CABaseAnimation）",
                        @"关键帧动画（CAKeyFrameAnimation）",
                        @"旋转",
                        @"平移"];
    for (unsigned int i = 0; i < titles.count; i++) {
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10 , 70 + (60)*i , FULL_SCREEN_WIDTH - 20, 50);
        button.backgroundColor = [UIColor redColor];
        button.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        button.tag = i;
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(dosomeThing:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }

    // Do any additional setup after loading the view.
}

- (void)dosomeThing:(UIButton *)sender {
    switch (sender.tag) {
        case 0:{
            JFCABaseAnimationViewController *VC = [[JFCABaseAnimationViewController alloc] init];
            VC.title = @"CABaseAnimation";
            [self.navigationController pushViewController:VC animated:YES];
        }break;
        case 1:{
            JFCAKeyframeAnimationViewController *VC = [[JFCAKeyframeAnimationViewController alloc] init];
            VC.title = @"CAKeyFrameAnimation";
            [self.navigationController pushViewController:VC animated:YES];
        }break;
        case 2:{
            
        }break;
        case 3:{
            
            
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
