//
//  CollectionView.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CollectionView : UIView
<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *ContentArray;
@property (nonatomic, strong) NSMutableArray *ImageViewArray;
- (void)setUI;
@end

NS_ASSUME_NONNULL_END
