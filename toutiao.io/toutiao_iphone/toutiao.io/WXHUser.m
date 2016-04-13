//
//  WXHUser.m
//  toutiao.io
//
//  Created by Apple on 16/3/22.
//  Copyright © 2016年 wxh. All rights reserved.
//

#import "WXHUser.h"

@implementation WXHUser

+(JSONKeyMapper *)keyMapper{
    
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"userId"}];
}

@end
