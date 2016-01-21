//
//  Lunbo.m
//  Watch
//
//  Created by lanou on 16/1/20.
//  Copyright (c) 2016年 MR. All rights reserved.
//

#import "Lunbo.h"
#define kWidth frame.size.width
#define kHeight frame.size.height
@implementation Lunbo
-(void)dealloc {
    
    [_show release];
    [_page release];
    [super dealloc];
}
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        _page = [[UIPageControl alloc]initWithFrame:CGRectMake(kWidth - 120, kHeight - 40, 120, 40)];
        _page.numberOfPages = 5;
        _page.currentPage = 0;
        _page.currentPageIndicatorTintColor = [UIColor redColor];
        _page.pageIndicatorTintColor = [UIColor grayColor];
        _show = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
        _show.contentSize = CGSizeMake(kWidth *5, kHeight);
        _show.pagingEnabled = YES;
        _show.bounces = YES;
        [self addSubview:_show];
        [self addSubview:_page];
        for (int i = 0; i < 5; i ++) {
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(i *kWidth, 0, kWidth, kHeight)];
            imageView.image = [UIImage imageNamed:@"header_bg@2x"];
            [_show addSubview:imageView];
            [imageView release];
        }
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
