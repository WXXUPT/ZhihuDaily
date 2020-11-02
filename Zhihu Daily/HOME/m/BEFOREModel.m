//
//  BEFOREModel.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/20.
//

#import "BEFOREModel.h"

@implementation BEFOREModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
@end

@implementation SToriesModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
        @"ID":@"id"
    }];
}
@end
