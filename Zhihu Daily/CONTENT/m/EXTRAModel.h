//
//  EXTRAModel.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/1.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface EXTRAModel : JSONModel
@property (nonatomic, strong) NSNumber *long_comments;
@property (nonatomic, strong) NSNumber *popularity;
@property (nonatomic, strong) NSNumber *short_comments;
@property (nonatomic, strong) NSNumber *comments;
@end
//"long_comments": 0,
//"popularity": 161,
//"short_comments": 19,
//"comments": 19,
NS_ASSUME_NONNULL_END
