//
//  COMMENTSViewController.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/5.
//

#import "COMMENTSViewController.h"
#import "CONTENTManager.h"
@interface COMMENTSViewController ()

@end

@implementation COMMENTSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.longCommentsModel = [[LongCommentsModel alloc] init];
    self.shortCommentsModel = [[ShortCommentsModel alloc] init];
    self.extraModel = [[EXTRAModel alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    self.commentsView = [[COMMENTSView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.commentsView];
    
    [self postData];
}
- (void)postData {
    [[CONTENTManager sharedManager] netWorkForLongCommentsWithID:self.ID succeed:^(LongCommentsModel *longComments) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.longCommentsModel = longComments;
            //[self.commentsView.tableView reloadData];
        });
        } error:^(NSError * _Nonnull error) {
            NSLog(@"error");
        }];
    [[CONTENTManager sharedManager] netWorkForShortCommentsWithID:self.ID succeed:^(ShortCommentsModel * shortComments) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.shortCommentsModel = shortComments;
            //[self.commentsView.tableView reloadData];
        });
        } error:^(NSError * _Nonnull error) {
            NSLog(@"error");
        }];
    [[CONTENTManager sharedManager] netWorkForExtraWithID:self.ID succeed:^(EXTRAModel * _Nonnull extraModel) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.extraModel = extraModel;
        });
        } error:^(NSError * _Nonnull error) {
            NSLog(@"error");
        }];
}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//  return 2;
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//    if (section == 0) {
//        if ([self.extraModel.long_comments integerValue] > 13) {
//            return 13;
//        } else {
//            return [self.extraModel.long_comments integerValue];
//        }
//    } else {
//        if ([self.extraModel.short_comments integerValue] > 20) {
//            return 20;
//        } else {
//            return [self.extraModel.short_comments integerValue];
//        }
//    }
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
//    return 0;
//}
//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    return 0;
//}
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
