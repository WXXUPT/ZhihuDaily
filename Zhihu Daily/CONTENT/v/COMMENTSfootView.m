//
//  COMMENTSfootView.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/5.
//

#import "COMMENTSfootView.h"

@implementation COMMENTSfootView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.headImageView = [[UIImageView alloc] init];
        self.sayLabel = [[UILabel alloc] init];
        
        [self.headImageView setImage:[UIImage imageNamed:@"touxiang.png"]];
        self.headImageView.frame = CGRectMake(10, 10, 30, 30);
        
        self.sayLabel.text = @"说说你的看法...";
        self.sayLabel.font = [UIFont systemFontOfSize:15];
        self.sayLabel.textColor = [UIColor grayColor];
        self.sayLabel.frame = CGRectMake(50, 17, 200, 20);
        
        [self addSubview:self.headImageView];
        [self addSubview:self.sayLabel];
    }
    return self;
}

@end
