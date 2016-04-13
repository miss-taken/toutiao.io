//
//  WXH_APIClientManager.m
//  toutiao.io
//
//  Created by Apple on 16/3/23.
//  Copyright © 2016年 wxh. All rights reserved.
//

#import "WXH_APIClientManager.h"

@implementation WXH_APIClientManager

+ (instancetype) shareInstance{
    static dispatch_once_t onceToken;
    static WXH_APIClientManager *shareInstance;
    dispatch_once(&onceToken, ^{
        shareInstance = [[WXH_APIClientManager alloc] init];
    });
    return shareInstance;
}


-(void)requestLastestEssenceWithSuccBlock:(void (^)(id))succBlock andFailedBlock:(void (^)(NSString *, HttpFailedType))failedBlock{
    
    static NSString *lastestUrlString = @"http://api.toutiao.io/v2/dailies/latest?app_key=nid5puvc9t0v7hltuy1u&signature=bf64ca1907b19b31f2e00e2d99c211250c047678&timestamp=1458526251";
    
    
    [[WXH_APIClient shareInstance] requestJsonWithUrl:lastestUrlString withMethodType:Requst_Get withParams:nil withSuccBlock:^(id responseObject) {
        succBlock(responseObject);
    } andFailedBlock:^(NSString *errorInfo, HttpFailedType failedType) {
        failedBlock(errorInfo,failedType);
    }];
}

@end
