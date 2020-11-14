//
//  ShortCommentsModel.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/5.
//

#import "ShortCommentsModel.h"
@implementation ShortReplyModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return  YES;
}
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
        @"ID":@"id"
    }];
}
@end

@implementation SecondCommentModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
        @"ID":@"id"
    }];
}
@end

@implementation ShortCommentsModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end
