//
//  JFFollowStockViewController.h
//  test
//
//  Created by je_ffy on 2017/5/10.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JFBaseViewController.h"


/**
 原理：
 1.每一行是一个cell，其中cell包括 左侧不可滑动的Label，以及一个Scrollview
 2.cell 联动，每个cell 上面添加手势，注册通知，不是自己发出的时候，移动
 3.cell 与headerView 联动
 */
@interface JFFollowStockViewController : JFBaseViewController

@end
