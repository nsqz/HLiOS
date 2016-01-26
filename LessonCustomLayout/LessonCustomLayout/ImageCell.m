//
//  ImageCell.m
//  LessonCustomLayout
//
//  Created by lanou on 16/1/26.
//  Copyright (c) 2016年 MR. All rights reserved.
//

#import "ImageCell.h"

@implementation ImageCell




- (void)dealloc
{
    [_imageView release];
    [_numberLabel release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupSubviews];
    }
    return self;
}

- (void)setupSubviews
{
    _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    _imageView.backgroundColor = [UIColor colorWithRed:arc4random() % 256 / 255.0 green:arc4random() % 256 / 255.0 blue:arc4random() % 256 / 255.0 alpha:1.0];
    [self.contentView addSubview:_imageView];
    
    //    CGFloat width = self.frame.size.width;
    //    CGFloat height = self.frame.size.height;
    
    _numberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 50, 20)];
    [_imageView addSubview:_numberLabel];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    _imageView.frame = self.bounds;
}
@end
