//
//  MAINViewController.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/24.
//

#import <UIKit/UIKit.h>
#import "MAINView.h"
#import "NEWSModel.h"
#import "BEFOREModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface MAINViewController : UIViewController
<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate, MAINViewDelegate>
@property MAINView *mainView;
@property NSInteger days;
@property (nonatomic, strong) NSMutableArray *data;
@property long nowDate;

@property StoriesModel *storiesModel;
@property Top_StoriesModel *top_storiesModel;
@property NSInteger temp;
@property (nonatomic, copy) NSMutableArray *oneStr;
@property (nonatomic, copy) NSMutableArray *twoStr;
@property bool isReady;
@property bool isReady2;
@end

NS_ASSUME_NONNULL_END
