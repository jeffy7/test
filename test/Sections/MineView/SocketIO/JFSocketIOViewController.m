//
//  JFSocketIOViewController.m
//  test
//
//  Created by je_ffy on 2017/7/31.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFSocketIOViewController.h"
static NSString * const serverURL = @"http://ws.bimao.com";
@interface JFSocketIOViewController ()

//dev first
//rebase test
//dev test6

@end

@implementation JFSocketIOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    NSURL* url = [[NSURL alloc] initWithString:serverURL];
//    SocketIOClient* socket = [[SocketIOClient alloc] initWithSocketURL:url config:@{@"log": @YES, @"compress": @YES}];
//    
//    [socket on:@"connect" callback:^(NSArray* data, SocketAckEmitter* ack) {
//        NSLog(@"++++++++++++socket connected");
//    }];
//    
//    [socket on:@"currentAmount" callback:^(NSArray* data, SocketAckEmitter* ack) {
//        double cur = [[data objectAtIndex:0] floatValue];
//        
//        [[socket emitWithAck:@"canUpdate" with:@[@(cur)]] timingOutAfter:0 callback:^(NSArray* data) {
////            [socket emit:@"update" withItems:@[@{@"amount": @(cur + 2.50)}]];
//        }];
//        
//        [ack with:@[@"Got your currentAmount, ", @"dude"]];
//    }];
//    
//    
//    [socket on:@"exchange:rate" callback:^(NSArray * _Nonnull data, SocketAckEmitter * _Nonnull ack) {
//        
//        
////        if ([data[0] isKindOfClass:[NSDictionary class]]) {
////            self.exchangeRate = [data[0][@"data"]  mutableCopy] ;
////        }
//        
//        NSLog(@"xxxxxxxxxxxxr(SocketIOClientStatusConnected = 3) socket status:%@",data);
//        NSLog(@"rrrrrrrrrractNum:%@",ack);
//        //        NSLog(@"连接成功连接成功连接成功连接成功连接成功连接成功连接成功连接成功连接成功连接成功");
//    }];
//    [socket connect];
    
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
