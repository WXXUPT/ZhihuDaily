//
//  ZhihuManager.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/20.
//

#import "ZhihuManager.h"
@implementation ZhihuManager
static ZhihuManager *manager = nil;
+ (instancetype)sharedLeton {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[super allocWithZone:NULL] init];
        });
    }
    return manager;
}
+ (id)allocWithZone:(struct _NSZone *)zone {
    return [ZhihuManager sharedLeton];
}
- (id)copyWithZone:(NSZone *)zone {
    return [ZhihuManager sharedLeton];
}
- (void)networkforNewnews:(NSInteger)number succeed:(NewnewsHandle)successblock error:(ErrorHandle)errorblock {
    NSString *string = @"http://news-at.zhihu.com/api/4/news/latest";
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSError *err = nil;
            NEWSModel *newsModel = [[NEWSModel alloc] initWithDictionary:dict error:&err];
            successblock(newsModel);
        } else {
            errorblock(error);
        }
    }];
    [dataTask resume];
}
- (void)contentNewsWithID:(NSString *)ID succeed:(ContentnewsHandle)successblock error:(ErrorHandle)errorblock {
    NSString *string = [NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/news/%@",ID];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error == nil) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSError *err = nil;
            CONTENTModel *contentModel = [[CONTENTModel alloc] initWithDictionary:dict error:&err];
            successblock(contentModel);
        } else {
            errorblock(error);
        }
    }];
    [dataTask resume];
}
- (void)beforeNewsWithID:(NSString *)ID succeed:(BeforenewsHandle)successblock error:(ErrorHandle)errorblock {
    NSString *string = [NSString stringWithFormat:@"%@",ID];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *datatask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (nil == error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSError *err = nil;
            BEFOREModel *beforeModel = [[BEFOREModel alloc] initWithDictionary:dict error:&err];
            successblock(beforeModel);
        } else {
            errorblock(error);
        }
    }];
    [datatask resume];
}

@end
//新闻额外信息http://news-at.zhihu.com/api/4/story-extra/#{id}
//新闻对应长评论http://news-at.zhihu.com/api/4/story/#{id}/long-comments
//新闻对应短评论http://news-at.zhihu.com/api/4/story/#{id}/short-comments
