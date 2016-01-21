//
//  MyTableViewCell.m
//  Watch
//
//  Created by lanou on 16/1/21.
//  Copyright (c) 2016年 MR. All rights reserved.
//

#import "MyTableViewCell.h"
#define kHeight self.contentView.frame.size.height
#define kWidth self.contentView.frame.size.width
@implementation MyTableViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)dealloc {
    [_price release];
    [_nameLabel release];
    [_image release];
    [_watch release];
    [super dealloc];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        _nameLabel = [[UILabel alloc]initWithFrame:CGRectZero];
        _nameLabel.numberOfLines = 0;
        [self.contentView addSubview:_nameLabel];
        _price = [[UILabel alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:_price];
        _image = [[UIImageView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:_image];
    }
    return self;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    _image.frame = CGRectMake(5, 0, (kHeight - 10) *4 / 5 , kHeight);
    _nameLabel.frame = CGRectMake((kHeight - 10) *4 / 5 + 10, 5, kHeight *3.2/2, kHeight - 10);
    _price.frame = CGRectMake(kWidth - kHeight, 5, kHeight, kHeight - 10);

}
-(void)setWatch:(Watch *)watch {
    if (_watch != watch) {
        [_watch release];
        _watch = [watch retain];
        _image.image = [UIImage imageNamed:_watch.image_name];
        _nameLabel.text = _watch.title;
        _price.text = watch.price;
    }

}
@end
