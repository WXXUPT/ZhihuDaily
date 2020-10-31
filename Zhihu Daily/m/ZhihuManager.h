//
//  ZhihuManager.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/20.
//

#import <Foundation/Foundation.h>
#import "NEWSModel.h"
#import "BEFOREModel.h"
#import "CONTENTModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^NewnewsHandle)(NEWSModel *newsModel);
typedef void(^BeforenewsHandle)(BEFOREModel *beforeModel);
typedef void(^ContentnewsHandle)(CONTENTModel *contentModel);
typedef void(^ErrorHandle)(NSError *error);
@interface ZhihuManager : NSObject <NSCopying,NSURLSessionDelegate>
+ (instancetype)sharedLeton;
+ (id)allocWithZone:(struct _NSZone *)zone;
- (void)networkforNewnews:(NSInteger)number succeed:(NewnewsHandle)successblock error:(ErrorHandle)errorblock;
- (void)beforeNewsWithdate:(long)date succeed:(BeforenewsHandle)successblock error:(ErrorHandle)errorblock;
@end

NS_ASSUME_NONNULL_END
