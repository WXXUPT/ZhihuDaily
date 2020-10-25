//
//  CONTENTTableViewCell.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/25.
//

#import "CONTENTTableViewCell.h"

@implementation CONTENTTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.selectionStyle = NO;
    self.contentImageView = [[UIImageView alloc] init];
    self.hintLabel = [[UILabel alloc] init];
    self.titleLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_contentImageView];
    [self.contentView addSubview:_hintLabel];
    [self.contentView addSubview:_titleLabel];
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    _titleLabel.frame = CGRectMake(20, 30, 30, 30);
    _titleLabel.font = [UIFont systemFontOfSize:21];
    _titleLabel.textColor = [UIColor blackColor];
    
    _hintLabel.frame = CGRectMake(20, 70, 20, 20);
    _hintLabel.font = [UIFont systemFontOfSize:16];
    _hintLabel.textColor = [UIColor grayColor];
    
    _contentImageView.frame = CGRectMake(410, 15, 90, 90);
}
@end
