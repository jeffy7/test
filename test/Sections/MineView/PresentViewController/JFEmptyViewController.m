//
//  JFEmptyViewController.m
//  test
//
//  Created by je_ffy on 2017/6/28.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFEmptyViewController.h"

@interface JFEmptyViewController ()

@end

@implementation JFEmptyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UINavigationController *nav =  globalApp.rootController.selectedViewController;
//    CC_LOG_VALUE(nav.viewControllers);
    
    CC_LOG_VALUE(globalApp.topViewController);
    // Do any additional setup after loading the view.
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
