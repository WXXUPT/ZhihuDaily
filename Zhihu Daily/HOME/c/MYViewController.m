//
//  MYViewController.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/25.
//

#import "MYViewController.h"
#import "MYTableViewCell1.h"
#import "MYTableViewCell2.h"
#import "MYTableViewCell3.h"
#import "CollectionViewController.h"
@interface MYViewController ()

@end

@implementation MYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 50, 414, 840) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    [self.tableView registerClass:[MYTableViewCell1 class] forCellReuseIdentifier:@"mycell1"];
    [self.tableView registerClass:[MYTableViewCell2 class] forCellReuseIdentifier:@"mycell2"];
    [self.tableView registerClass:[MYTableViewCell3 class] forCellReuseIdentifier:@"mycell3"];
    [self.view addSubview:_tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 50, 414, 70)];
    navBar.barTintColor = [UIColor whiteColor];
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:nil];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:self action:@selector(pressBack)];
    UIImage *leftImage = [UIImage imageNamed:@"fanhui.png"];
    [leftButton setImage:[leftImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [navBar pushNavigationItem:navItem animated:NO];
    [navItem setLeftBarButtonItem:leftButton];
    navBar.translucent = YES;
    [self.view addSubview:navBar];
    [self.tableView reloadData];
}
- (void)pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    } else if (section == 1) {
        return 2;
    } else {
        return 1;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 170;
    } else if (indexPath.section == 1) {
        return 60;
    } else {
        return 350;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MYTableViewCell1 *cell1 = [tableView dequeueReusableCellWithIdentifier:@"mycell1" forIndexPath:indexPath];
        cell1.selectionStyle = 0;
        return cell1;
    } else if (indexPath.section == 1) {
        MYTableViewCell2 *cell2 = [tableView dequeueReusableCellWithIdentifier:@"mycell2" forIndexPath:indexPath];
        cell2.selectionStyle = 0;
        if (indexPath.row == 0) {
            cell2.contentLabel.text = @"我的收藏";
            return cell2;
        } else {
            cell2.contentLabel.text = @"消息中心";
            return cell2;
        }
    } else {
        MYTableViewCell3 *cell3 = [tableView dequeueReusableCellWithIdentifier:@"mycell3" forIndexPath:indexPath];
        cell3.selectionStyle = 0;
        return cell3;
    }
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CollectionViewController *collectionViewController = [[CollectionViewController alloc] init];
    if (indexPath.section == 1 && indexPath.row == 0) {
        collectionViewController.modalPresentationStyle = 0;
        [self presentViewController:collectionViewController animated:NO completion:nil];
    } else {
        
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
