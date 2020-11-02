//
//  MAINViewController.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/24.
//

#import "MAINViewController.h"
#import "ZhihuManager.h"
#import "NEWSModel.h"
#import "BEFOREModel.h"
#import "MYViewController.h"
#import "CONTENTTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "CONTENTViewController.h"
@interface MAINViewController ()

@end

@implementation MAINViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.days = 0;
    self.temp = 0;
    self.isReady = false;
    self.isReady2 = false;
    _data = [[NSMutableArray alloc] init];
    _oneStr = [[NSMutableArray alloc] init];
    _twoStr = [[NSMutableArray alloc] init];
    
    self.view.backgroundColor = [UIColor whiteColor];
    _mainView = [[MAINView alloc] initWithFrame:CGRectMake(0, 0, 414, 740)];
    [_mainView setUI];
    [self.view addSubview:_mainView];
    
    _mainView.MAINViewDelegate = self;
    _mainView.mainTableView.delegate = self;
    _mainView.mainTableView.dataSource = self;
    
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 50, 414, 70)];
    navBar.barTintColor = [UIColor whiteColor];
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:@"知乎日报"];
    
    if (_days == 0) {
    [[ZhihuManager sharedLeton] networkforNewnews:1 succeed:^(NEWSModel *newsModel) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *dateStr = [NSString stringWithFormat:@"%ld  丨  知乎日报",newsModel.date];
            self.nowDate = newsModel.date;
            self.nowDate = 20201031;
            self.temp = newsModel.stories.count;
            [self.oneStr addObjectsFromArray:newsModel.stories];
            [self.twoStr addObjectsFromArray:newsModel.top_stories];
            UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:dateStr style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
            [leftButton setTintColor:[UIColor blackColor]];
            UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:self action:@selector(pressRight)];
            UIImage *rightImage = [UIImage imageNamed:@"touxiang.png"];
            [rightButton setImage:[rightImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
            [navBar pushNavigationItem:navItem animated:NO];
            [navItem setLeftBarButtonItem:leftButton];
            [navItem setRightBarButtonItem:rightButton];
            [self.view addSubview:navBar];
            self.days++;
            self.isReady = YES;
            [self.mainView.mainTableView reloadData];
            
            NSMutableArray *imageArray = [[NSMutableArray alloc] init];
            for (int h = 0; h < 5; h++) {
                NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[newsModel.top_stories[h] imageStr]]];
                UIImage *image = [UIImage imageWithData:data];
                [imageArray addObject:image];
            }
            self.mainView.mainScrollView.images = imageArray;
            self.mainView.mainTableView.tableHeaderView = self.mainView.mainScrollView;
        });
        } error:^(NSError *error) {
            NSLog(@"todayError");
        }];
    }
}
//谁用这个方法谁是脑残
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    float height = scrollView.contentSize.height > self.mainView.mainTableView.frame.size.height ? self.mainView.mainTableView.frame.size.height : scrollView.contentSize.height;
//    if ((height - scrollView.contentSize.height + scrollView.contentOffset.y) / height > 0.1) {
//        [self.mainView addSubview:self.mainView.activityIndcator];
//        [self.mainView.activityIndcator startAnimating];
//        [self netWorkBefore];
//    }
//}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat currentOffsetY = scrollView.contentOffset.y;
    if (currentOffsetY +scrollView.frame.size.height + 5 > scrollView.contentSize.height) {
                [self.mainView addSubview:self.mainView.activityIndcator];
                [self.mainView.activityIndcator startAnimating];
                [self netWorkBefore];
    }
}
- (void)netWorkBefore {
        [[ZhihuManager sharedLeton] beforeNewsWithdate:self.nowDate succeed:^(BEFOREModel *beforeModel) {
            self.days++;
            self.nowDate--;
            self.isReady2 = true;
                    dispatch_async(dispatch_get_main_queue(), ^{
                        [self.data addObjectsFromArray:beforeModel.stories];
                        [self.mainView.activityIndcator stopAnimating];
                        [self.mainView.mainTableView reloadData];
                    });
                } error:^(NSError *error) {
                    NSLog(@"beforeError");
                }];
}
- (void)pressLeft {
    
}
- (void)pressRight {
    MYViewController *myViewController = [[MYViewController alloc] init];
    myViewController.modalPresentationStyle = 0;
    [self presentViewController:myViewController animated:YES completion:nil];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_isReady == false && _isReady2 == false) {
        return 0;
    } else if (_isReady == true && _isReady2 == false) {
        return 1;
    } else {
        return 2;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.temp;
    } else {
        return [self.data count];
    }
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
        CONTENTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        cell.titleLabel.text = [self.oneStr[indexPath.row] title];
        cell.hintLabel.text = [self.oneStr[indexPath.row] hint];
        
        NSString *str = [[NSString alloc] init];
        str = (NSString *) [_oneStr[indexPath.row] images][0];
        [cell.contentImageView sd_setImageWithURL:[NSURL URLWithString:str]];
        cell.titleLabel.numberOfLines = 2;
        return cell;
    } else {
        CONTENTTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        cell.titleLabel.text = [_data[indexPath.row] title];
        cell.hintLabel.text = [self.data[indexPath.row] hint];
        NSString *str = [[NSString alloc ] init];
        str = (NSString *) [_data[indexPath.row] images][0];
        [cell.contentImageView sd_setImageWithURL:[NSURL URLWithString:str]];
        cell.titleLabel.numberOfLines = 2;
        return cell;
    }
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CONTENTViewController *contentViewController = [[CONTENTViewController alloc] init];
    if (indexPath.section == 0) {
        contentViewController.ID = [self.oneStr[indexPath.row] ID];
        contentViewController.modalPresentationStyle = 0;
        [self presentViewController:contentViewController animated:YES completion:nil];
    } else {
        contentViewController.ID = [self.data[indexPath.row] ID];
        contentViewController.modalPresentationStyle = 0;
        [self presentViewController:contentViewController animated:YES completion:nil];
    }
}
- (void)pass:(NSInteger)index {
    NSLog(@"3");
    CONTENTViewController *contentViewController = [[CONTENTViewController alloc] init];
    contentViewController.ID = [self.twoStr[index] ID];
    contentViewController.modalPresentationStyle = 0;
    [self presentViewController:contentViewController animated:YES completion:nil];
}

@end
