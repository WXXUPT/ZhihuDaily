//
//  CONTENTViewController.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/31.
//

#import <UIKit/UIKit.h>
#import "CONTENTView.h"
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CONTENTViewController : UIViewController<WKUIDelegate, UIScrollViewDelegate>
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, strong) CONTENTView *contentView;
@property (nonatomic, strong) NSMutableArray *data;
@property (nonatomic, strong) NSMutableArray *IDArray;
@property (nonatomic, assign) int index;
@end

NS_ASSUME_NONNULL_END
