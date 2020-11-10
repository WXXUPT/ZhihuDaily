//
//  COMMENTSViewController.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/5.
//

#import <UIKit/UIKit.h>
#import "COMMENTSView.h"
NS_ASSUME_NONNULL_BEGIN

@interface COMMENTSViewController : UIViewController
@property (nonatomic, copy) NSString* ID;
@property (nonatomic, strong) NSMutableArray *extraArray;
@property (nonatomic, strong) NSMutableArray *longArray;
@property (nonatomic, strong) NSMutableArray *shortArray;
@property (nonatomic, strong) COMMENTSView *commentsView;
@end

NS_ASSUME_NONNULL_END
