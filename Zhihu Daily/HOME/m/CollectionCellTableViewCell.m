//
//  CollectionCellTableViewCell.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/22.
//

#import "CollectionCellTableViewCell.h"

@implementation CollectionCellTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.contentLabel = [[UILabel alloc] init];
    self.contentImageView = [[UIImageView alloc] init];
    
    [self.contentView addSubview:self.contentLabel];
    [self.contentView addSubview:self.contentView];
    
    return self;
}
- (void)layoutSubviews {
    self.contentLabel.font = [UIFont systemFontOfSize:20];
    self.contentLabel.textColor = [UIColor blackColor];
    self.contentLabel.frame = CGRectMake(20, 10, 240, 65);
    
    self.contentView.frame = CGRectMake(10, 265, 90, 90);
}
@end
