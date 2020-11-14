//
//  COMMENTSView.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/5.
//

#import <UIKit/UIKit.h>
#import "COMMENTSfootView.h"
NS_ASSUME_NONNULL_BEGIN

@interface COMMENTSView : UIView <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) COMMENTSfootView *footView;

@property (nonatomic, assign) NSInteger NumberOfComments;
@property (nonatomic, assign) NSInteger NumberOfLongComments;
@property (nonatomic, assign) NSInteger NumberOfShortComments;

@property (nonatomic, strong) NSMutableArray *longComment;
@property (nonatomic, strong) NSMutableArray *longCommentImages;
@property (nonatomic, strong) NSMutableArray *longCommentAuthor;
@property (nonatomic, strong) NSMutableArray *longCommentTime;
@property (nonatomic, strong) NSMutableArray *longCommentReply;
@property (nonatomic, strong) NSMutableArray *longCommentAuthorReply;

@property (nonatomic, strong) NSMutableArray *shortComment;
@property (nonatomic, strong) NSMutableArray *shortCommentImages;
@property (nonatomic, strong) NSMutableArray *shortCommentAuthor;
@property (nonatomic, strong) NSMutableArray *shortCommentTime;
@property (nonatomic, strong) NSMutableArray *shortCommentReply;
@property (nonatomic, strong) NSMutableArray *shortCommentAuthorReply;

@property (nonatomic, assign) bool didChange;
@property (nonatomic, assign) bool didSecondChange;

@end

NS_ASSUME_NONNULL_END
