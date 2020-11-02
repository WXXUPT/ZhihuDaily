//
//  CONTENTManager.m
//  Zhihu Daily
//
//  Created by 王旭 on 2020/10/31.
//

#import "CONTENTManager.h"

@implementation CONTENTManager
static CONTENTManager *manager = nil;
+ (instancetype)sharedManager {
    if (!manager) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            manager = [[super allocWithZone:NULL] init];
        });
    }
    return manager;
}
+ (id)allocWithZone:(struct _NSZone *)zone {
    return [CONTENTManager sharedManager];
}
- (id)copyWithZone:(NSZone *)zone {
    return [CONTENTManager sharedManager];
}
- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler{
    NSURLCredential *card = [[NSURLCredential alloc] initWithTrust:challenge.protectionSpace.serverTrust];
    completionHandler(NSURLSessionAuthChallengeUseCredential,card);
}
- (void)netWorkForContentWithID:(NSString*)ID succeed:(getContent)succeedblock error:(errorBlock)errorblock {
    NSString *string = [NSString stringWithFormat:@" http://news-at.zhihu.com/api/4/news/%@",ID];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
    NSURLSessionDataTask *datatask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (nil == error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSError *err = nil;
            CONTENTModel *contentModel = [[CONTENTModel alloc] initWithDictionary:dict error:&err];
            succeedblock(contentModel);
        } else {
            errorblock(error);
        }
    }];
    [datatask resume];
}
- (void)netWorkForExtraWithID:(NSString*)ID succeed:(getExtra)succeedblock error:(errorBlock)errorblock {
    NSString *string = [NSString stringWithFormat:@"http://news-at.zhihu.com/api/4/story-extra/%@",ID];
    NSURL *url = [NSURL URLWithString:string];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[[NSOperationQueue alloc] init]];
    NSURLSessionDataTask *datatask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (nil == error) {
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSError *err = nil;
            EXTRAModel *extraModel = [[EXTRAModel alloc] initWithDictionary:dict error:&err];
            succeedblock(extraModel);
        } else {
            errorblock(error);
        }
    }];
    [datatask resume];
}
@end
