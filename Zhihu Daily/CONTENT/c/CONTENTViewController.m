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
#import "FMDatabase.h"
@interface CONTENTViewController ()
@property bool isChange;
@end

@implementation CONTENTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.data = [[NSMutableArray alloc] init];
    self.contentView = [[CONTENTView alloc] initWithFrame:self.view.frame];
//    [self.view addSubview:self.contentView];
    [self setWebView];
    [self.contentView.footView.commentsButton addTarget:self action:@selector(pressComments) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView.footView.backButton addTarget:self action:@selector(pressBack) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView.footView.goodButton addTarget:self action:@selector(pressGood) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView.footView.collectionButton addTarget:self action:@selector(pressCollect) forControlEvents:UIControlEventTouchUpInside];

}
- (void)setWebView {
    self.ID = [self.IDArray[self.index] ID];
    self.isChange = YES;
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height*0.9)];
    webView.UIDelegate = self;
    webView.scrollView.delegate = self;
    NSString *str = [NSString stringWithFormat:@"https://daily.zhihu.com/story/%@", self.ID];
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
    [self.view addSubview:self.contentView];
    [self.contentView addSubview:webView];
}
- (void)pressGood {
//    self.contentView.footView.goodButton.tintColor = [UIColor redColor];
}
- (void)pressCollect {
//    self.contentView.footView.collectionButton.tintColor = [UIColor redColor];
    for (int i = 0; i < 1; i++) {
        NSString * docPath=[[NSString alloc]init];
            docPath=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
        NSLog(@"docPath==%@",docPath);
        NSString * fileName=[docPath stringByAppendingPathComponent:@"content.sqlite"];//设置数据库名称
                FMDatabase * fmdb=[FMDatabase databaseWithPath:fileName];//创建并获取数据库信息
            if ([fmdb open]) {
                NSLog(@"数据库打开成功！");
            } else {
                NSLog(@"数据库打开失败！");
            }
        BOOL executeUpdate = [fmdb executeUpdate:@"CREATE TABLE IF NOT EXISTS t_content (Content text NOT NULL, ImageView text NOT NULL);"];
            if (executeUpdate) {
                NSLog(@"创建表成功");
            } else {
                NSLog(@"创建表失败");
            }
        BOOL results = [fmdb executeUpdate:@"INSERT INTO t_content (Content,ImageView) VALUES (?,?)",[self.IDArray[_index] title],[self.IDArray[_index] images]];
        if (results) {
            NSLog(@"插入成功");
        } else {
            NSLog(@"插入失败");
        }
        FMResultSet * resultSet = [fmdb executeQuery:@"select * from t_content"];
            while ([resultSet next]) {
                NSString *Content = [resultSet objectForColumnName:@"Content"];
                NSString *ImageView = [resultSet objectForColumnName:@"ImageView"];
                NSLog(@"%@ %@",Content,ImageView);
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
- (void)dealloc {
    NSLog(@"222");
}
@end
