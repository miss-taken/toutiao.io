//
//  WXH_APIClientManager.h
//  toutiao.io
//
//  Created by Apple on 16/3/23.
//  Copyright © 2016年 wxh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WXH_APIClient.h"


@interface WXH_APIClientManager : NSObject

+ (instancetype) shareInstance;

/**
 *  获取最新精选列表信息
 *
 *  @param params      请求参数
 *  @param succBlock   成功回调
 *  @param failedBlock 失败回调
 */
- (void)requestLastestEssenceWithSuccBlock:(void(^)(id responseObject))succBlock andFailedBlock:(void(^)(NSString *errorInfo,HttpFailedType failedType))failedBlock;


@end
