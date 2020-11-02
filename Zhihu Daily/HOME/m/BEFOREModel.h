//
//  BEFOREModel.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/20.
//
@protocol SToriesModel
@end
#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface SToriesModel : JSONModel
@property (nonatomic, copy) NSString *hint;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSArray *images;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *ID;
@end
@interface BEFOREModel : JSONModel
//@property (nonatomic) long date;
@property (nonatomic, strong) NSArray<SToriesModel> *stories;
@end

NS_ASSUME_NONNULL_END
