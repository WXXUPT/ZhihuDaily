//
//  COMMENTSViewController.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/5.
//

#import "COMMENTSViewController.h"

@interface COMMENTSViewController ()

@end

@implementation COMMENTSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.extraArray = [[NSMutableArray alloc] init];
    self.longArray = [[NSMutableArray alloc] init];
    self.shortArray = [[NSMutableArray alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    self.commentsView = [[COMMENTSView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.commentsView];
}
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//}
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//
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
