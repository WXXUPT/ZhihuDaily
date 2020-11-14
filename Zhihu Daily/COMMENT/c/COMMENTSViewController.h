//
//  COMMENTSViewController.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/5.
//

#import <UIKit/UIKit.h>
#import "COMMENTSView.h"
#import "LongCommentsModel.h"
#import "ShortCommentsModel.h"
#import "EXTRAModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface COMMENTSViewController : UIViewController
@property (nonatomic, copy) NSString* ID;
@property (nonatomic, strong) EXTRAModel *extraModel;
@property (nonatomic, strong) COMMENTSView *commentsView;
@property (nonatomic, strong) LongCommentsModel *longCommentsModel;
@property (nonatomic, strong) ShortCommentsModel *shortCommentsModel;
@end

NS_ASSUME_NONNULL_END
