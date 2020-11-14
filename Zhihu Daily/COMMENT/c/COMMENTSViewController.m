//
//  COMMENTSViewController.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/5.
//

#import "COMMENTSViewController.h"
#import "CONTENTManager.h"
#import "COMMENTSView.h"
#import "CommentsTableViewCell.h"
@interface COMMENTSViewController ()

@end

@implementation COMMENTSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.longCommentsModel = [[LongCommentsModel alloc] init];
    self.shortCommentsModel = [[ShortCommentsModel alloc] init];
    self.extraModel = [[EXTRAModel alloc] init];
    self.view.backgroundColor = [UIColor whiteColor];
    self.commentsView = [[COMMENTSView alloc] initWithFrame:self.view.frame];
    [self.commentsView.footView.backButton addTarget:self action:@selector(pressBack) forControlEvents:UIControlStateNormal];
    [self.view addSubview:self.commentsView];
    
    [self postData];
}
- (void)pressBack {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)postData {
    [[CONTENTManager sharedManager] netWorkForLongCommentsWithID:self.ID succeed:^(LongCommentsModel *longComments) {
        self.commentsView.longComment = [[NSMutableArray alloc] init];
        self.commentsView.longCommentTime = [[NSMutableArray alloc] init];
        self.commentsView.longCommentReply = [[NSMutableArray alloc] init];
        self.commentsView.longCommentAuthor = [[NSMutableArray alloc] init];
        self.commentsView.longCommentImages = [[NSMutableArray alloc] init];
        self.commentsView.longCommentAuthorReply = [[NSMutableArray alloc] init];
        for (int i = 0; i < longComments.comments.count; i++) {
            [self.commentsView.longComment addObject:[longComments.comments[i]content]];
            [self.commentsView.longCommentImages addObject:[longComments.comments[i]avatar]];
            [self.commentsView.longCommentAuthor addObject:[longComments.comments[i]author]];
            [self.commentsView.longCommentTime addObject:[longComments.comments[i]time]];
            if ([longComments.comments[i]reply_to] != nil) {
                [self.commentsView.longCommentReply addObject:[longComments.comments[i]reply_to].content];
                [self.commentsView.longCommentAuthorReply addObject:[longComments.comments[i]reply_to].author];
            } else {
                [self.commentsView.longCommentReply addObject:@"a"];
                [self.commentsView.longCommentAuthorReply addObject:@"a"];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.commentsView.tableView reloadData];
        });
        } error:^(NSError * _Nonnull error) {
            NSLog(@"error");
        }];
    [[CONTENTManager sharedManager] netWorkForShortCommentsWithID:self.ID succeed:^(ShortCommentsModel * shortComments) {
        self.commentsView.shortComment = [[NSMutableArray alloc] init];
        self.commentsView.shortCommentImages = [[NSMutableArray alloc] init];
        self.commentsView.shortCommentAuthor = [[NSMutableArray alloc] init];
        self.commentsView.shortCommentTime = [[NSMutableArray alloc] init];
        self.commentsView.shortCommentAuthorReply = [[NSMutableArray alloc] init];
        self.commentsView.shortCommentReply = [[NSMutableArray alloc] init];
        for (int i = 0; i < shortComments.comments.count; i++) {
            [self.commentsView.shortComment addObject:[shortComments.comments[i]content]];
            [self.commentsView.shortCommentImages addObject:[shortComments.comments[i]avatar]];
            [self.commentsView.shortCommentAuthor addObject:[shortComments.comments[i]author]];
            [self.commentsView.shortCommentTime addObject:[shortComments.comments[i]time]];
            if ([shortComments.comments[i]reply_to] != nil) {
                [self.commentsView.shortCommentReply addObject:[shortComments.comments[i]reply_to].content];
                [self.commentsView.shortCommentAuthorReply addObject:[shortComments.comments[i]reply_to].author];
            } else {
                [self.commentsView.shortCommentReply addObject:@"a"];
                [self.commentsView.shortCommentAuthorReply addObject:@"a"];
            }
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.commentsView.tableView reloadData];
        });
        } error:^(NSError * _Nonnull error) {
            NSLog(@"error");
        }];
    [[CONTENTManager sharedManager] netWorkForExtraWithID:self.ID succeed:^(EXTRAModel * _Nonnull extraModel) {
        self.commentsView.NumberOfComments = [self change:extraModel.comments];
        self.commentsView.NumberOfLongComments = [self change:extraModel.long_comments];
        self.commentsView.NumberOfShortComments = [self change:extraModel.short_comments];
        dispatch_async(dispatch_get_main_queue(), ^{
//            self.extraModel = extraModel;
            [self.commentsView.tableView reloadData];
        });
        } error:^(NSError * _Nonnull error) {
            NSLog(@"error");
        }];
}
- (int)change:(NSString *)s {
    int secondFlag = 0;
    int sum = 0, num = 0;
        num = [s characterAtIndex:0] - '0';
        for (int i = 1; i < s.length; i++) {
                if (secondFlag == 0) {
                    num = num * 10 + (double)[s characterAtIndex:i] - '0';
                } else {
                    secondFlag++;
                    num = num + ((double)[s characterAtIndex:i] - '0') * pow(10, -secondFlag);
                }
        }
    sum += num;
    return sum;
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
