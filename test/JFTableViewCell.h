//
//  JFTableViewCell.h
//  test
//
//  Created by je_ffy on 16/3/27.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *desc;
@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@property (nonatomic, strong) NSMutableArray *dataArray;


@end
