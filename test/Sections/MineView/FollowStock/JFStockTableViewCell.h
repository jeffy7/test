//
//  JFStockTableViewCell.h
//  test
//
//  Created by je_ffy on 2017/5/10.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import <UIKit/UIKit.h>
static NSString *tapCellScrollNotification = @"tapCellScrollNotification";

typedef void(^TapCellClick)(NSIndexPath *);

@interface JFStockTableViewCell : UITableViewCell

@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) TapCellClick tapCellClick;

@end
