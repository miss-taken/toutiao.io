//
//  WXHEssenceData.h
//  toutiao.io
//
//  Created by Apple on 16/3/23.
//  Copyright © 2016年 wxh. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "WXHArticle.h"

@interface WXHEssenceData : JSONModel

@property(nonatomic,strong,nullable) NSString* date;
@property(nonatomic,strong,nullable) NSString* pre_date;
@property(nonatomic,strong,nullable) NSString* next_date;
@property(nonatomic,assign) BOOL is_today;
@property(nonatomic,strong,nullable) NSString* share_url;
@property(nonatomic,strong,nullable) NSMutableArray<WXHArticle>* article;


@end
