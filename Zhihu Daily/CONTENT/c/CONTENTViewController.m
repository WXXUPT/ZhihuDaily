//
//  CONTENTViewController.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/31.
//

#import "CONTENTViewController.h"
#import "CONTENTManager.h"
#import "EXTRAModel.h"
#import "COMMENTSViewController.h"
#import <WebKit/WebKit.h>
@interface CONTENTViewController ()

@end

@implementation CONTENTViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.data = [[NSMutableArray alloc] init];
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height*0.9)];
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    NSString *str = [NSString stringWithFormat:@"https://daily.zhihu.com/story/%@", self.ID];
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.contentView addSubview:webView];
    [self.view addSubview:self.contentView];
    
    [self postnetWork];
    
    [self.contentView.footView.commentsButton addTarget:self action:@selector(pressComments) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView.footView.backButton addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView.footView.goodButton addTarget:self action:@selector(pressGood) forControlEvents:UIControlEventTouchUpInside];
}
- (void) pressGood {
//    [self.contentView.footView.goodButton setImage:[UIImage imageNamed:@"dianzan2.png"] forState:UIControlStateHighlighted];
}
- (void)pressComments {
    COMMENTSViewController *viewController = [[COMMENTSViewController alloc] init];
    viewController.modalPresentationStyle = 0;
    viewController.extraArray = [[NSMutableArray alloc] init];
    viewController.extraArray = _data;
    viewController.ID = self.ID;
    [self presentViewController:viewController animated:YES completion:nil];
}
- (void)pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)postnetWork {
    [[CONTENTManager sharedManager] netWorkForExtraWithID:self.ID succeed:^(EXTRAModel *extraModel) {
            dispatch_async(dispatch_get_main_queue(), ^{
                NSLog(@"%d",extraModel.comments);
                [self.data addObject:extraModel.comments];
                [self.data addObject:extraModel.long_comments];
                [self.data addObject:extraModel.popularity];
                [self.data addObject:extraModel.short_comments];
            });
        } error:^(NSError *error) {
            NSLog(@"error");
        }];
    NSLog(@"1");
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
