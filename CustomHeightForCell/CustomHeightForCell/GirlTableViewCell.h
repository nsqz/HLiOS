//
//  GirlTableViewCell.h
//  CustomHeightForCell
//
//  Created by lanou on 16/1/23.
//  Copyright (c) 2016年 MR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Student.h"

@interface GirlTableViewCell : UITableViewCell

@property (nonatomic, retain)UIImageView *headerImageView;//头像
@property (nonatomic, retain)UILabel *nameLabel;//姓名
@property (nonatomic, retain)UILabel *phoneLabel; //电话
@property (nonatomic, retain)UILabel *introduceLabel; //自我介绍
@property (nonatomic, retain)UILabel *sexLabel;//性别

@property (nonatomic, retain)Student *student;
//求一段文本的显示高度
+(CGFloat)heightForString:(NSString *)string;

+(CGFloat)cellHeightForStudent:(Student *)student;


-(void)sendStudent:(Student *)student;
@end
