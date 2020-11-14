//
//  COMMENTSView.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/5.
//

#import <UIKit/UIKit.h>
#import "COMMENTSfootView.h"
NS_ASSUME_NONNULL_BEGIN

@interface COMMENTSView : UIView
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) COMMENTSfootView *footView;
@end

NS_ASSUME_NONNULL_END
