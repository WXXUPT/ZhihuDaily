//
//  MYTableViewCell3.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/27.
//

#import "MYTableViewCell3.h"

@implementation MYTableViewCell3
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    self.shezhiButton = [[UIButton alloc] init];
    self.shezhiLabel = [[UILabel alloc] init];
    self.yejianButton = [[UIButton alloc] init];
    self.yejianLabel = [[UILabel alloc] init];
    
    [self.contentView addSubview:_shezhiButton];
    [self.contentView addSubview:_yejianButton];
    [self.contentView addSubview:_shezhiLabel];
    [self.contentView addSubview:_yejianLabel];
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];

    [self.yejianButton setImage:[UIImage imageNamed:@"yejianmoshi.png"] forState:UIControlStateNormal];
    self.yejianButton.frame = CGRectMake(85, 240, 37, 37);
    
    [self.shezhiButton setImage:[UIImage imageNamed:@"ziyuan.png"] forState:UIControlStateNormal];
    self.shezhiButton.frame = CGRectMake(255, 240, 37, 37);
    
    self.yejianLabel.frame = CGRectMake(77, 285, 100, 16);
    self.yejianLabel.font = [UIFont systemFontOfSize:14];
    self.yejianLabel.text = @"夜间模式";
    self.yejianLabel.textColor = [UIColor blackColor];
    
    self.shezhiLabel.frame = CGRectMake(259, 285, 100, 16);
    self.shezhiLabel.font = [UIFont systemFontOfSize:14];
    self.shezhiLabel.text = @"设置";
    self.shezhiLabel.textColor = [UIColor blackColor];
}
@end
