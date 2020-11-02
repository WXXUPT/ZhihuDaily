//
//  CONTENTViewController.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/31.
//

#import "CONTENTViewController.h"
#import "CONTENTManager.h"
#import "EXTRAModel.h"
#import <WebKit/WebKit.h>
@interface CONTENTViewController ()

@end

@implementation CONTENTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.data = [[NSMutableArray alloc] init];
    
    self.contentView = [[CONTENTView alloc] initWithFrame:CGRectMake(0, 0, 414, 840)];
    [self.contentView setUI];
    [self.view addSubview:self.contentView];
    
    
    [self postnetWork];
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, 414, 840)];
    self.view = webView;
    webView.UIDelegate = self;
    webView.navigationDelegate = self;
    NSString *str = [NSString stringWithFormat:@"https://daily.zhihu.com/story/%@", self.ID];
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}
- (void)postnetWork {
    [[CONTENTManager sharedManager] netWorkForExtraWithID:self.ID succeed:^(EXTRAModel *extraModel) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
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
