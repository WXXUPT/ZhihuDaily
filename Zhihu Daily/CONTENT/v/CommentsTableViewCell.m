//
//  CommentsTableViewCell.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/5.
//

#import "CommentsTableViewCell.h"

@implementation CommentsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    self.headImageView = [[UIImageView alloc] init];
    self.nameLabel = [[UILabel alloc] init];
    self.moreImageView = [[UIImageView alloc] init];
    self.contentLabel = [[UILabel alloc] init];
    self.timeLabel = [[UILabel alloc] init];
    self.goodButton = [[UIButton alloc] init];
    self.commentImageView = [[UIImageView alloc] init];
    
    [self.contentView addSubview:self.headImageView];
    [self.contentView addSubview:self.nameLabel];
    [self.contentView addSubview:self.moreImageView];
    [self.contentView addSubview:self.contentView];
    [self.contentView addSubview:self.timeLabel];
    [self.contentView addSubview:self.goodButton];
    [self.contentView addSubview:self.commentImageView];
    
    return self;
}
- (void)layoutSubviews {
    
}
@end
