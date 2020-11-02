//
//  CONTENTModel.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/21.
//

#import "CONTENTModel.h"

@implementation CONTENTModel
+ (BOOL)propertyIsOptional:(NSString *)propertyName {
    return YES;
}
+ (JSONKeyMapper *)keyMapper {
    return [[JSONKeyMapper alloc] initWithModelToJSONDictionary:@{
        @"imageStr":@"image"
    }];
}
@end
