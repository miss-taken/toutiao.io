//
//  WXHEssenceResponse.h
//  toutiao.io
//
//  Created by Apple on 16/3/23.
//  Copyright © 2016年 wxh. All rights reserved.
//

#import <JSONModel/JSONModel.h>
#import "WXHEssenceData.h"

@interface WXHEssenceResponse : JSONModel

@property(nonatomic,assign) NSInteger errcode;
@property(nonatomic,strong,nullable) NSString* msg;
@property(nonatomic,strong,nullable) WXHEssenceData* data;
@property(nonatomic,assign) NSInteger ret;

@end
