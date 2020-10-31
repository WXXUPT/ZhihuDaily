//
//  CONTENTTableViewCell.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/25.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CONTENTTableViewCell : UITableViewCell
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *hintLabel;
@property (nonatomic, strong) UIImageView *contentImageView;
@end

NS_ASSUME_NONNULL_END
