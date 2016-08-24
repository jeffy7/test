//
//  JFCycleView.h
//  test
//
//  Created by je_ffy on 16/7/25.
//  Copyright © 2016年 je_ffy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JFCycleView : UIView

- (void)scrollDidScroll:(UIScrollView *)scrollView;
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change;
- (void)rotateTheCircle;
- (void)stopTheCircleRote;
- (void)clearTheAnimation;

@end
