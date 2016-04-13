//
//  WXHArticle.m
//  toutiao.io
//
//  Created by Apple on 16/3/22.
//  Copyright © 2016年 wxh. All rights reserved.
//

#import "WXHArticle.h"

@implementation WXHArticle

+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"id":@"articleId"}];
}

@end
