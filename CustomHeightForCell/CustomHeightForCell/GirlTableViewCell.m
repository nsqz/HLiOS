//
//  GirlTableViewCell.m
//  CustomHeightForCell
//
//  Created by lanou on 16/1/23.
//  Copyright (c) 2016年 MR. All rights reserved.
//

#import "GirlTableViewCell.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kImageWidth ((kWidth -30)/4)

@implementation GirlTableViewCell

+(CGFloat)heightForString:(NSString *)string {
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:17],NSFontAttributeName, nil];
    
    CGRect rect = [string boundingRectWithSize:CGSizeMake( 3 * kImageWidth , 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    return rect.size.height;
}

+(CGFloat)cellHeightForStudent:(Student *)student{
    CGFloat totalHigth =65 + [GirlTableViewCell heightForString:student.introduce];
    
    return (120 > totalHigth ? 120   : totalHigth);
}
-(void)sendStudent:(Student *)student {
    _headerImageView.image = [UIImage imageNamed:student.icon];
    _nameLabel.text = student.name;
    _phoneLabel.text = student.phoneNumber;
    _introduceLabel.text = student.introduce;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    CGFloat imageWidth = (kWidth - 30) / 4;
    _sexLabel.frame = CGRectMake(10, 5, 20, 20);
    _nameLabel.frame = CGRectMake(40, 5, 80, 20);
    _phoneLabel.frame = CGRectMake(40, 35, 120, 20);
    _introduceLabel.frame = CGRectMake(10, 65, 3 *imageWidth, [GirlTableViewCell heightForString:self.student.introduce]);
    _headerImageView.frame = CGRectMake(3 *imageWidth + 20, 5, imageWidth, 110);
    
    
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _headerImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _phoneLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _introduceLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _sexLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:_introduceLabel];
        [self.contentView addSubview:_nameLabel];
        [self.contentView addSubview:_headerImageView];
        [self.contentView addSubview:_phoneLabel];
        [self.contentView addSubview:_sexLabel];
        _introduceLabel.numberOfLines = 0;
    }
    return self;
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
