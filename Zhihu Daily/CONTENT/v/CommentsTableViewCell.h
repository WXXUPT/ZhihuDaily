//
//  CommentsTableViewCell.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/5.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CommentsTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *goodButton;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UIImageView *commentImageView;
@property (nonatomic, strong) UIImageView *moreImageView;
@end

NS_ASSUME_NONNULL_END
