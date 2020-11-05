//
//  CONTENTView.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/31.
//

#import "CONTENTView.h"

@implementation CONTENTView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.footView = [[CONTENTfootView alloc] initWithFrame:CGRectMake(0, self.frame.size.height*0.90, self.frame.size.width, self.frame.size.height*0.10)];
        [self addSubview:_footView];
    }
    return self;
}
@end
