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
    
    _titleLabel.frame = CGRectMake(17, 25, 250, 50);
    _titleLabel.font = [UIFont systemFontOfSize:18];
    _titleLabel.textColor = [UIColor blackColor];
    
    _hintLabel.frame = CGRectMake(17, 80, 200, 20);
    _hintLabel.font = [UIFont systemFontOfSize:15];
    _hintLabel.textColor = [UIColor grayColor];
    
    _contentImageView.frame = CGRectMake(265, 15, 90, 90);
}
@end
