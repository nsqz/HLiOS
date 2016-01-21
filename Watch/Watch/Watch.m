//
//  Watch.m
//  Watch
//
//  Created by lanou on 16/1/20.
//  Copyright (c) 2016年 MR. All rights reserved.
//

#import "Watch.h"

@implementation Watch
-(void)setValue:(id)value forUndefinedKey:(NSString *)key {
    if ([key isEqualToString:@"id"]) {
        self.number = value;
    } else if ([key isEqualToString:@"description"]) {
        self.description1 = value;
    }


}
@end
