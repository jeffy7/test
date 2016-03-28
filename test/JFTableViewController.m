//
//  JFTableViewController.m
//  test
//
//  Created by je_ffy on 16/3/27.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import "JFTableViewController.h"
#import "JFTableViewCell.h"

@interface JFTableViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation JFTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    JFTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"JFTableViewCell"];
    
    return cell;
}


@end
