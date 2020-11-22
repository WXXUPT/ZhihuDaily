//
//  CollectionView.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/22.
//

#import "CollectionView.h"
#import "CollectionCellTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "FMDatabase.h"
@implementation CollectionView
- (void)setUI {
    self.ContentArray = [[NSMutableArray alloc] init];
    self.ImageViewArray = [[NSMutableArray alloc] init];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 414, 840) style:UITableViewStyleGrouped];
    [self addSubview:self.tableView];
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.tableView registerClass:[CollectionCellTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.bounces = YES;
    [self toDate];
}
- (void)toDate {
    NSString * docPath=[[NSString alloc]init];
        docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSLog(@"docPath==%@",docPath);
    NSString * fileName=[docPath stringByAppendingPathComponent:@"content.sqlite"];//设置数据库名称
            FMDatabase * fmdb=[FMDatabase databaseWithPath:fileName];//创建并获取数据库信息
        if ([fmdb open]) {
            NSLog(@"数据库打开成功！");
        } else {
            NSLog(@"数据库打开失败！");
        }
    FMResultSet * resultSet = [fmdb executeQuery:@"select * from t_content"];
        while ([resultSet next]) {
            NSString *Content = [resultSet objectForColumnName:@"Content"];
            NSString *ImageView = [resultSet objectForColumnName:@"ImageView"];
            [self.ContentArray addObject:Content];
            [self.ImageViewArray addObject:ImageView];
        }
    NSLog(@"%@ %@",_ContentArray, _ImageViewArray);
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_ContentArray.count == 0) {
        return 0;
    } else {
        return 1;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_ContentArray count];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 110;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CollectionCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.contentLabel.text = _ContentArray[indexPath.row];
        NSString *str = [[NSString alloc] init];
        str = _ImageViewArray[indexPath.row];
        str = [str substringFromIndex:7];
        for (int i = 0; i < str.length; i++) {
            if ([str characterAtIndex:i] == '"') {
                NSString *str0 = [str substringToIndex:i];
                str = [NSString stringWithFormat:@"%@", str0];
                break;
            }
        }
        [cell.contentImageView sd_setImageWithURL:[NSURL URLWithString:str]];
        return cell;
    }
    return 0;
}
@end
