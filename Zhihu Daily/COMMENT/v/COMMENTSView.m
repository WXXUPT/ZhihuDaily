//
//  COMMENTSView.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/5.
//

#import "COMMENTSView.h"
#import "CommentsTableViewCell.h"
#import "UIImageView+WebCache.h"
@implementation COMMENTSView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height*0.9)];
        self.tableView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_tableView];
        self.footView = [[COMMENTSfootView alloc] initWithFrame:CGRectMake(0, self.frame.size.height*0.9, self.frame.size.width, self.frame.size.height*0.1)];
        [self addSubview:_footView];
        self.didChange = NO;
        self.didSecondChange = NO;
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 300;
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        self.tableView.tag = 111;
    }
    return self;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.NumberOfComments > 20) {
        return 20 + self.NumberOfComments;
    }
    return self.NumberOfComments;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
}
@end
