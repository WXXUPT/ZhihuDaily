//
//  MAINView.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/23.
//

#import <UIKit/UIKit.h>
#import "CONTENTTableViewCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface MAINView : UIView <UITableViewDelegate, UITableViewDataSource>
//@property CONTENTTableViewCell *cell;
@property (nonatomic, copy) NSArray *hintArray;
@property (nonatomic, copy) NSArray *titleArray;
@property (nonatomic, strong) UIScrollView *mainScrollView;
@property (nonatomic, strong) UITableView *mainTableView;
@end

NS_ASSUME_NONNULL_END
