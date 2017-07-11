//
//  JFPresentViewController.m
//  test
//
//  Created by je_ffy on 2017/6/28.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFPresentViewController.h"
#import "JFEmptyViewController.h"

@interface JFPresentViewController ()

@end

@implementation JFPresentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UINavigationController *nav =  globalApp.rootController.selectedViewController;
    CC_LOG_VALUE(nav.viewControllers);
    CC_LOG_VALUE(nav.topViewController);
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    button.layer.borderWidth = 0.50f;
    button.layer.borderColor = [UIColor redColor].CGColor;
    [button addTarget:self action:@selector(doSomething) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    // Do any additional setup after loading the view.
    
}

- (void)doSomething {
    JFEmptyViewController *emptyVC = JFEmptyViewController.new;
//    CC_LOG_VALUE(emptyVC);
    UINavigationController *navVc = [[UINavigationController alloc] initWithRootViewController:emptyVC];
//    CC_LOG_VALUE(navVc);
    [self presentViewController:navVc animated:YES completion:^{
        
    }];
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
