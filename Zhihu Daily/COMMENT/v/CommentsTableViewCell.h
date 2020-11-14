//
//  CommentsTableViewCell.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommentsTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *longCommentLabel;
@property (nonatomic, strong) UIImageView *longCommentImageView;
@property (nonatomic, strong) UILabel *longCommentAuthorLabel;
@property (nonatomic, strong) UILabel *longCommentTime;
@property (nonatomic, strong) UILabel *longCommentReplyLabel;

@property (nonatomic, strong) UILabel *shortCommentLabel;
@property (nonatomic, strong) UIImageView *shortCommentImageView;
@property (nonatomic, strong) UILabel *shortCommentAuthorLabel;
@property (nonatomic, strong) UILabel *shortCommentTime;
@property (nonatomic, strong) UILabel *shortCommentReplyLabel;

@property (nonatomic, strong) UIButton *foldButton;
@property (nonatomic, strong) UIButton *longFoldButton;
@end

NS_ASSUME_NONNULL_END
