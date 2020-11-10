//
//  COMMENTSView.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/5.
//

#import "COMMENTSView.h"

@implementation COMMENTSView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*0.9)];
        self.tableView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_tableView];
        self.footView = [[COMMENTSfootView alloc] initWithFrame:CGRectMake(0, self.frame.size.height*0.9, self.frame.size.width, self.frame.size.height*0.1)];
        [self addSubview:_footView];
    }
    return self;
}
@end
