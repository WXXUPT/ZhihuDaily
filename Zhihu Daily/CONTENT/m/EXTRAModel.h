//
//  EXTRAModel.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/1.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EXTRAModel : JSONModel
@property (nonatomic, copy) NSString *long_comments;
@property (nonatomic, copy) NSString *popularity;
@property (nonatomic, copy) NSString *short_comments;
@property (nonatomic, copy) NSString *comments;
@end
//"long_comments": 0,
//"popularity": 161,
//"short_comments": 19,
//"comments": 19,
NS_ASSUME_NONNULL_END
