//
//  LongCommentsModel.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/5.
//
@protocol LongCommentModel
@end
#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LongReplyModel : JSONModel
@property (nonatomic, copy) NSString *content;
@property (nonatomic, assign) long status;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *author;
@end

@interface LongCommentModel : JSONModel
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *likes;
@property (nonatomic, copy) LongReplyModel *reply_to;
@end

@interface LongCommentsModel : JSONModel
@property (nonatomic, copy) NSArray<LongCommentModel> *comments;
@end
NS_ASSUME_NONNULL_END
