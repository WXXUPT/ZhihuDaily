//
//  MAINViewController.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/24.
//

#import "MAINViewController.h"
#import "ZhihuManager.h"
#import "NEWSModel.h"
#import "MYViewController.h"
//#import "MAINView.h"
@interface MAINViewController ()
@property StoriesModel *storiesModel;
@property Top_StoriesModel *top_storiesModel;
@end

@implementation MAINViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UINavigationBar *navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 50, 414, 70)];
    navBar.barTintColor = [UIColor whiteColor];
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:@"知乎日报"];
    [[ZhihuManager sharedLeton] networkforNewnews:1 succeed:^(NEWSModel *newsModel) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *dateStr = [NSString stringWithFormat:@"%@  丨  知乎日报",newsModel.date];
            UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:dateStr style:UIBarButtonItemStyleDone target:self action:@selector(pressLeft)];
            [leftButton setTintColor:[UIColor blackColor]];
            UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:nil style:UIBarButtonItemStylePlain target:self action:@selector(pressRight)];
            UIImage *rightImage = [UIImage imageNamed:@"touxiang.png"];
            [rightButton setImage:[rightImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
            [navBar pushNavigationItem:navItem animated:NO];
            [navItem setLeftBarButtonItem:leftButton];
            [navItem setRightBarButtonItem:rightButton];
            [self.view addSubview:navBar];
//            MAINView *mainView = [[MAINView alloc] init];
            
        });
        } error:^(NSError *error) {
            NSLog(@"1");
        }];
}
- (void)pressLeft {
    
}
- (void)pressRight {
    MYViewController *myViewController = [[MYViewController alloc] init];
    [self presentViewController:myViewController animated:YES completion:nil];
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
