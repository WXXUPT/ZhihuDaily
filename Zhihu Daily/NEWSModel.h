//
//  NEWSModel.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/20.
//

@protocol StoriesModel
@end
@protocol Top_StoriesModel
@end
#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN
@interface StoriesModel : JSONModel
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *hint;
@property (nonatomic, copy) NSString *images;
@property (nonatomic, copy) NSString *ID;
@end

@interface Top_StoriesModel : JSONModel
@property (nonatomic, copy) NSString *hint;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *imageStr;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *ID;
@end
@interface NEWSModel : JSONModel
@property (nonatomic, copy) NSString*date;
@property (nonatomic, copy) NSArray<StoriesModel> *stories;
@property (nonatomic, copy) NSArray<Top_StoriesModel> *top_stories;
@end

NS_ASSUME_NONNULL_END
