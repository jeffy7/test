//
//  UILabel+SPUtils.m
//  ShangPin
//
//  Created by je_ffy on 2017/2/22.
//  Copyright © 2017年 feng lu. All rights reserved.
//

#import "UILabel+SPUtils.h"

@implementation UILabel (SPUtils)

- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing {
    if (!text) {
        self.text = text;
        return;
    }
    
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSFontAttributeName value:self.font range:NSMakeRange(0, [text length])];
    
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:0.0f];
    [paragraphStyle setLineBreakMode:self.lineBreakMode];
    [paragraphStyle setAlignment:self.textAlignment];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    
    self.attributedText = attributedString;
}

@end
