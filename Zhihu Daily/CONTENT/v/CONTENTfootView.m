//
//  CONTENTfootView.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/4.
//

#import "CONTENTfootView.h"

@implementation CONTENTfootView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        
        self.backButton = [[UIButton alloc] init];
        self.commentsButton = [[UIButton alloc] init];
        self.goodButton = [[UIButton alloc] init];
        self.shareButton = [[UIButton alloc] init];
        self.collectionButton = [[UIButton alloc] init];
        
        self.backButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.commentsButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.goodButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.collectionButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.shareButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
        [self.backButton setImage:[UIImage imageNamed:@"fanhui.png"] forState:UIControlStateNormal];
        [self.backButton setTintColor:[UIColor blackColor]];
        [self.commentsButton setImage:[UIImage imageNamed:@"pinglun.png"] forState:UIControlStateNormal];
        [self.commentsButton setTintColor:[UIColor blackColor]];
        [self.goodButton setImage:[UIImage imageNamed:@"dianzan.png"] forState:UIControlStateNormal];
        [self.goodButton setTintColor:[UIColor blackColor]];
        [self.shareButton setImage:[UIImage imageNamed:@"shangchuan.png"] forState:UIControlStateNormal];
        [self.shareButton setTintColor:[UIColor blackColor]];
        [self.collectionButton setImage:[UIImage imageNamed:@"shoucang.png"] forState:UIControlStateNormal];
        [self.collectionButton setTintColor:[UIColor blackColor]];
        
        [self addSubview:_backButton];
        [self addSubview:_commentsButton];
        [self addSubview:_goodButton];
        [self addSubview:_shareButton];
        [self addSubview:_collectionButton];
        
        self.backButton.frame = CGRectMake(15, 20, 25, 25);
        self.commentsButton.frame = CGRectMake(80, 20, 27, 27);
        self.goodButton.frame = CGRectMake(160, 20, 27, 27);
        self.collectionButton.frame = CGRectMake(240, 20, 27, 27);
        self.shareButton.frame = CGRectMake(320, 20, 27, 27);
    }
    return self;
}

@end
