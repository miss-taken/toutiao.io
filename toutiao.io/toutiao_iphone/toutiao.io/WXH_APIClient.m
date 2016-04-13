//
//  WXH_APIClient.m
//  toutiao.io
//
//  Created by Apple on 16/3/23.
//  Copyright © 2016年 wxh. All rights reserved.
//

#import "WXH_APIClient.h"

@implementation WXH_APIClient


+ (instancetype) shareInstance;
{
    static dispatch_once_t onceToken;
    static WXH_APIClient *shareInstance;
    dispatch_once(&onceToken, ^{
        shareInstance = [[WXH_APIClient alloc] init];
        
        shareInstance.responseSerializer = [AFJSONResponseSerializer serializer];
        shareInstance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", @"text/javascript", @"text/json", @"text/html", nil];
        
        [shareInstance.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        }];
        [shareInstance.reachabilityManager startMonitoring];
    });
    return shareInstance;
}



-(void)requestJsonWithUrl:(NSString *)url withMethodType:(MethodType)methodType withParams:(NSDictionary *)params withSuccBlock:(void (^)(id))succBlock andFailedBlock:(void (^)(NSString *, HttpFailedType))failedBlock{
    
    switch (methodType) {
        case Requst_Get:{
            
            [self GET:url parameters:params success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
                succBlock(responseObject);
                
            } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
                failedBlock(@"",Http_Time_Out);
            }];


            break;
        }
        case Requst_Post:{

            
            
            break;
        }
        default:{
        
        break;
        }
    }
}


@end
