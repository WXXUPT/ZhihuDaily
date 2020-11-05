//
//  LongCommentsModel.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/5.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface LongCommentsModel : JSONModel
//author : 评论作者
//id : 评论者的唯一标识符
//content : 评论的内容
//likes : 评论所获『赞』的数量
//time : 评论时间
//avatar : 用户头像图片的地址
@property (nonatomic, copy) NSString *author;
@property (nonatomic, copy) NSString *ID;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *likes;
@property (nonatomic, copy) NSString *time;
@property (nonatomic, copy) NSString *avatar;
@end

NS_ASSUME_NONNULL_END
