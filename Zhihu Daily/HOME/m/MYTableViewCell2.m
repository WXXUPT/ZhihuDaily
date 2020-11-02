//
//  MYTableViewCell2.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/27.
//

#import "MYTableViewCell2.h"

@implementation MYTableViewCell2

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.contentImageView = [[UIImageView alloc] init];
    self.contentLabel = [[UILabel alloc] init];
    
    [self.contentView addSubview:_contentLabel];
    [self.contentView addSubview:_contentImageView];
    
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    _contentLabel.font = [UIFont systemFontOfSize:17];
    _contentLabel.textColor = [UIColor blackColor];
    _contentLabel.frame = CGRectMake(10, 20, 200, 20);
    
    _contentImageView.frame = CGRectMake(330, 15, 30, 30);
    [_contentImageView setImage:[UIImage imageNamed:@"you.png"]];
}
@end
