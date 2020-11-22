//
//  CollectionView.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/22.
//

#import "CollectionView.h"
#import "CollectionCellTableViewCell.h"
@implementation CollectionView
- (void)setUI {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 414, 840) style:UITableViewStyleGrouped];
    [self.tableView registerClass:[UICollectionViewCell class] forCellReuseIdentifier:@"cell1"];
    self.tableView.backgroundColor = [UIColor whiteColor];

    self.tableView.bounces = YES;
    [self addSubview:self.tableView];
}
@end
