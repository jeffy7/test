//
//  JFArchiveFather.m
//  test
//
//  Created by je_ffy on 2017/3/9.
//  Copyright © 2017年 je_ffy. All rights reserved.
//

#import "JFArchiveFather.h"

@interface JFArchiveFather () <NSCoding>

@end

@implementation JFArchiveFather

- (id)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
//        self.name = [aDecoder decodeObjectForKey:@"name"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
//    [aCoder encodeObject:_name forKey:@"name"];
}


@end
