//
//  MAINView.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/23.
//

#import <UIKit/UIKit.h>
#import "CONTENTTableViewCell.h"
#import "CarouselView.h"
NS_ASSUME_NONNULL_BEGIN

@protocol MAINViewDelegate <NSObject>
- (void)pass:(NSInteger)index;
@end

@interface MAINView : UIView <CarouselViewDelegate>
@property (nonatomic, strong) CarouselView *mainScrollView;
@property (nonatomic, strong) UITableView *mainTableView;
@property (nonatomic, strong) UIActivityIndicatorView *activityIndcator;
@property id<MAINViewDelegate> MAINViewDelegate;
- (void)setUI;
@end

NS_ASSUME_NONNULL_END
