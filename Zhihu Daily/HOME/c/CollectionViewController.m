//
//  CollectionViewController.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/22.
//

#import "CollectionViewController.h"
#import "CollectionView.h"
#import "CollectionCellTableViewCell.h"
@interface CollectionViewController ()

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.collectionView = [[CollectionView alloc] initWithFrame:CGRectMake(0, 70, 414, 740)];
    [self.collectionView setUI];
    [self.view addSubview:self.collectionView];
    
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 50, 414, 70)];
    navBar.barTintColor = [UIColor whiteColor];
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:@"收藏"];
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:self action:@selector(pressRight)];
    UIImage *leftImage = [UIImage imageNamed:@"fanhui.png"];
    [leftButton setImage:[leftImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [navBar pushNavigationItem:navItem animated:NO];
    [navItem setLeftBarButtonItem:leftButton];

    [self.view addSubview:navBar];
}
- (void)pressRight {
    [self dismissViewControllerAnimated:YES completion:nil];
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
