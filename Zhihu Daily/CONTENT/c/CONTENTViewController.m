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

    [self.view addSubview:self.contentView];
    [self setWebView];
    [self.contentView.footView.commentsButton addTarget:self action:@selector(pressComments) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView.footView.backButton addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView.footView.goodButton addTarget:self action:@selector(pressGood) forControlEvents:UIControlEventTouchUpInside];
}
- (void)setWebView {
    self.ID = [self.IDArray[self.index] ID];
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height*0.9)];
    webView.UIDelegate = self;
    webView.scrollView.delegate = self;
    NSString *str = [NSString stringWithFormat:@"https://daily.zhihu.com/story/%@", self.ID];
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.contentView addSubview:webView];
}
- (void)pressGood {
//    [self.contentView.footView.goodButton setImage:[UIImage imageNamed:@"dianzan2.png"] forState:UIControlStateHighlighted];
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat currentOffsetY = scrollView.contentOffset.y;
    if (currentOffsetY + scrollView.frame.size.height + 5 > scrollView.contentSize.height) {
        self.index++;
        [self setWebView];
    }
}
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
    if (scrollView.contentOffset.y <= -10) {
        if (self.index == 0) {
            
        } else {
            self.index--;
            [self setWebView];
        }
    }
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
- (void)dealloc {
    NSLog(@"222");
}
@end
