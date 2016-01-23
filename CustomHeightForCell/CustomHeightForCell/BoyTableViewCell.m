//
//  BoyTableViewCell.m
//  CustomHeightForCell
//
//  Created by lanou on 16/1/23.
//  Copyright (c) 2016年 MR. All rights reserved.
//

#import "BoyTableViewCell.h"
#define kWidth [UIScreen mainScreen].bounds.size.width
#define kImageWidth ((kWidth - 30)/4)
@implementation BoyTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+(CGFloat)heightForString:(NSString *)string {
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:17],NSFontAttributeName, nil];
    CGRect rest = [string boundingRectWithSize:CGSizeMake(3 *kImageWidth, 1000) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil];
    
    return rest.size.height;
    
}
+ (CGFloat)cellHeightForStudent:(Student *)student {
    CGFloat totalHeight = 65 + [BoyTableViewCell heightForString:student.introduce];
    return totalHeight > 120 ? totalHeight : 120;

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _headerImageView = [[UIImageView alloc]initWithFrame:CGRectZero];
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _phoneLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _introduceLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        
        [self.contentView addSubview:_headerImageView];
        [self.contentView addSubview:_nameLabel];
        [self.contentView addSubview:_phoneLabel];
        [self.contentView addSubview:_introduceLabel];
        _introduceLabel.numberOfLines = 0;
    }
    return self;
}

-(void)layoutSubviews {
    [super layoutSubviews];
//    CGFloat imageWidth = (kWidth - 30) / 4;
    _headerImageView.frame = CGRectMake(10, 5, kImageWidth, 110);
    _nameLabel.frame = CGRectMake(20 + kImageWidth, 5, 80, 20);
    _phoneLabel.frame = CGRectMake(20 + kImageWidth, 35, 120, 20);
    _introduceLabel.frame = CGRectMake(20 + kImageWidth, 65, 3 * kImageWidth, [BoyTableViewCell heightForString:self.student.introduce]);
    
}

-(void)sendStudent:(Student *)student {
   _headerImageView.image = [UIImage imageNamed:student.icon];
    _nameLabel.text = student.name;
    _phoneLabel.text = student.phoneNumber;
    _introduceLabel.text = student.introduce;
}
@end
