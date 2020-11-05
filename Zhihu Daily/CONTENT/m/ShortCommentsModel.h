//
//  ShortCommentsModel.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/5.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShortCommentsModel : JSONModel
@property (nonatomic, copy)NSString *author;
@property (nonatomic, copy)NSString *ID;
@property (nonatomic, copy)NSString *content;
@property (nonatomic, copy)NSString *likes;
@property (nonatomic, copy)NSString *time;
@property (nonatomic, copy)NSString *avatar;
@end

NS_ASSUME_NONNULL_END
