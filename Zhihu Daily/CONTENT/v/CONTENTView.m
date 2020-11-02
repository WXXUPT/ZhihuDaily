//
//  CONTENTView.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/31.
//

#import "CONTENTView.h"

@implementation CONTENTView
- (void)setUI {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 414, 840) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.bounces = NO;
    [self addSubview:_tableView];
}
@end
