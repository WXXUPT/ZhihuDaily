//
//  MYTableViewCell1.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/27.
//

#import "MYTableViewCell1.h"

@implementation MYTableViewCell1

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
     self.touxiangimageView = [[UIImageView alloc] init];
    self.nichengLabel = [[UILabel alloc] init];
    [self.contentView addSubview:_touxiangimageView];
    [self.contentView addSubview:_nichengLabel];
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    _touxiangimageView.frame = CGRectMake(140, 40, 90, 90);
    [_touxiangimageView setImage:[UIImage imageNamed:@"touxiang.png"]];
    _nichengLabel.font = [UIFont systemFontOfSize:19];
    _nichengLabel.frame = CGRectMake(140, 140, 100, 20);
    _nichengLabel.text = @"云月惊鸿来";
    _nichengLabel.textColor = [UIColor blackColor];
}
@end
