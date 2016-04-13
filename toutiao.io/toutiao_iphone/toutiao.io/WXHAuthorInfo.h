//
//  WXHAuthorInfo.h
//  toutiao.io
//
//  Created by Apple on 16/3/22.
//  Copyright © 2016年 wxh. All rights reserved.
//

#import <JSONModel.h>

@interface WXHAuthorInfo : JSONModel

@property(nonatomic,strong,nullable) NSString* name;
@property(nonatomic,strong,nullable) NSString* url;

@end
