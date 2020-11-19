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
    
        self.sayLabel = [[UILabel alloc] init];
        
        self.sayLabel.text = @"说说你的看法...(其实头像是一个返回按钮)";
        self.sayLabel.font = [UIFont systemFontOfSize:15];
        self.sayLabel.textColor = [UIColor grayColor];
        self.sayLabel.frame = CGRectMake(50, 17, 300, 20);
        
        self.backButton = [[UIButton alloc] init];
        self.backButton.frame = CGRectMake(10, 10, 30, 30);
        [self.backButton setImage:[UIImage imageNamed:@"touxiang.png"] forState:UIControlStateNormal];
        
        [self addSubview:self.backButton];
        [self addSubview:self.sayLabel];
    }
    return self;
}

@end
