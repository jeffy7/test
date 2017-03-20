//
//  JFRounderCornerViewController.m
//  test
//
//  Created by je_ffy on 2017/3/7.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFRounderCornerViewController.h"
#import "UIView+JFCorner.h"
#import "UIImage+JFCorner.h"
#import "JFCornerView.h"

@interface JFRounderCornerViewController ()

@end

@implementation JFRounderCornerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 100, 100)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor clearColor];
    [view addCorner:50 bgColor:[UIColor clearColor] borderWidth:1 borderColor:[UIColor blueColor]];
    
    UIImage *image = [[UIImage imageNamed:@"qq.jpg"] circleImage];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 240, 100, 100)];
    imageView.image = image;
    imageView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:imageView];
    
    JFCornerView *cornerView = [[JFCornerView alloc] initWithFrame:CGRectMake(20, 380, 100, 100)];
    [self.view addSubview:cornerView];
    cornerView.backgroundColor = [UIColor redColor];

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
