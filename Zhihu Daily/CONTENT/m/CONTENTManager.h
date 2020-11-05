//
//  CONTENTManager.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/31.
//

#import <Foundation/Foundation.h>
#import "CONTENTModel.h"
#import "EXTRAModel.h"
#import "LongCommentsModel.h"
#import "ShortCommentsModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^getContent)(CONTENTModel *content);
typedef void(^getExtra)(EXTRAModel *extraModel);
typedef void(^getLongComments)(LongCommentsModel *longComments);
typedef void(^getShortComments)(ShortCommentsModel *shortComments);
typedef void(^errorBlock)(NSError *error);
@interface CONTENTManager : NSObject<NSCopying, NSURLSessionDelegate>
+ (instancetype)sharedManager;
+ (id)allocWithZone:(struct _NSZone *)zone;
- (void)netWorkForContentWithID:(NSString*)ID succeed:(getContent)succeedblock error:(errorBlock)errorblock;
- (void)netWorkForExtraWithID:(NSString*)ID succeed:(getExtra)succeedblock error:(errorBlock)errorblock;
@end

NS_ASSUME_NONNULL_END
