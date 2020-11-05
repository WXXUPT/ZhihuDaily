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
    
    self.contentView = [[CONTENTView alloc] initWithFrame:self.view.frame];
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, 414, self.view.frame.size.height*0.9)];
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
}
- (void)pressComments {
    COMMENTSViewController *viewController = [[COMMENTSViewController alloc] init];
    viewController.modalPresentationStyle = 0;
    viewController.ID = self.ID;
    [self presentViewController:viewController animated:YES completion:nil];
}
- (void)pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)postnetWork {
    [[CONTENTManager sharedManager] netWorkForExtraWithID:self.ID succeed:^(EXTRAModel *extraModel) {
            dispatch_async(dispatch_get_main_queue(), ^{
//                [_data addObjectsFromArray:extraModel];
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
