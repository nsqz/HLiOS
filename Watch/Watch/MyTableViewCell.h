//
//  MyTableViewCell.h
//  Watch
//
//  Created by lanou on 16/1/21.
//  Copyright (c) 2016年 MR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Watch.h"
@interface MyTableViewCell : UITableViewCell


@property (nonatomic, retain)UIImageView *image;
@property (nonatomic, retain)UILabel *nameLabel;
@property (nonatomic, retain)UILabel *price;


@property (nonatomic, retain)Watch *watch;
@end
