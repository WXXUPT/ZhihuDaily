//
//  LongCommentsModel.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/11/5.
//

#import "LongCommentsModel.h"

@implementation LongCommentsModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
        @"ID":@"id"
    }];
}
@end
