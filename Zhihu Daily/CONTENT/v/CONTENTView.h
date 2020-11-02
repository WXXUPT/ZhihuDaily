//
//  CONTENTView.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CONTENTView : UIView
@property (nonatomic, strong) UITableView *tableView;
- (void)setUI;
@end

NS_ASSUME_NONNULL_END
