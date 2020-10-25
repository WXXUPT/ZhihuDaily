//
//  MAINView.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/23.
//

#import "MAINView.h"
#import "CONTENTTableViewCell.h"
@implementation MAINView
- (void)setUI {
    self.backgroundColor = [UIColor whiteColor];
    self.mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 414, 740) style:UITableViewStyleGrouped];
    [self.mainTableView registerClass:[CONTENTTableViewCell class] forCellReuseIdentifier:@"cell1"];
    self.mainTableView.delegate = self;
    self.mainTableView.dataSource = self;
    self.mainTableView.backgroundColor = [UIColor whiteColor];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        CONTENTTableViewCell *cell = [self.mainTableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor clearColor];
        
    }
    return 0;
}
@end
