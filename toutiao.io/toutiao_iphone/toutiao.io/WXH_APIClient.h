//
//  WXH_APIClient.h
//  toutiao.io
//
//  Created by Apple on 16/3/23.
//  Copyright © 2016年 wxh. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

typedef NS_ENUM(NSInteger,MethodType){
    Requst_Get,
    Requst_Post
};

typedef NS_ENUM(NSInteger,HttpFailedType) {
    Http_Time_Out, // 连接超时
    Http_Not_Found, // 404
    Http_No_NetWork // 没有网络
};

@interface WXH_APIClient : AFHTTPRequestOperationManager

+ (instancetype) shareInstance;

- (void)requestJsonWithUrl:(NSString*)url withMethodType:(MethodType)methodType withParams:(NSDictionary*)params withSuccBlock:(void(^)(id responseObject))succBlock andFailedBlock:(void(^)(NSString *errorInfo,HttpFailedType failedType))failedBlock;

@end
