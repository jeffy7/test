//
//  JFMainViewController.m
//  test
//
//  Created by je_ffy on 16/7/25.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "JFMainViewController.h"
#import "JFCycleView.h"

@interface JFMainViewController ()

@property (nonatomic, strong) JFCycleView *cycleView;

@end

@implementation JFMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self prepareCycleView];
    
}

- (void)prepareCycleView {
    self.cycleView.frame = CGRectMake(0, 64, 100, 100);

}

- (JFCycleView *)cycleView {
    if (!_cycleView) {
        JFCycleView *cycleView = [[JFCycleView alloc] init];
        cycleView.layer.borderWidth = 0.50f;
        cycleView.layer.borderColor = [UIColor redColor].CGColor;
        [self.view addSubview:_cycleView = cycleView];
    }
    return _cycleView;
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
