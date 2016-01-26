//
//  Model.m
//  LessonCustomLayout
//
//  Created by lanou on 16/1/26.
//  Copyright (c) 2016年 MR. All rights reserved.
//

#import "Model.h"

@implementation Model

-(void)setValue:(id)value forKey:(NSString *)key {


    [super setValue:value forKey:key];
    if ([key isEqualToString:@"width"]) {
        self.width = [value floatValue];
    }
    
    if ([key isEqualToString:@"height"]) {
        self.heght = [value floatValue];
    }
}

@end
