//
//  CONTENTModel.h
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/21.
//

#import "JSONModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface CONTENTModel : JSONModel
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *imageStr;
@property (nonatomic, copy) NSString *body;
@property (nonatomic, copy) NSString *image_source;
@end

NS_ASSUME_NONNULL_END
