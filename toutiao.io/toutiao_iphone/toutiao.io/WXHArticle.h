//
//  WXHArticle.h
//  toutiao.io
//
//  Created by Apple on 16/3/22.
//  Copyright © 2016年 wxh. All rights reserved.
//

#import <JSONModel.h>
#import "WXHUser.h"
#import "WXHSubject.h"
#import "WXHAuthorInfo.h"

@protocol WXHArticle <NSObject>

@end

@interface WXHArticle : JSONModel

@property(nonatomic,assign) BOOL is_advertorial;
@property(nonatomic,assign) long articleId;
@property(nonatomic,strong,nullable) NSString *title;
@property(nonatomic,strong,nullable) NSString* contributor;
@property(nonatomic,strong,nullable) NSString* original_site_name;
@property(nonatomic,assign) BOOL is_recommend;
@property(nonatomic,strong,nullable) NSString* original_url;
@property(nonatomic,strong,nullable) NSString<Optional>* image;
@property(nonatomic,strong,nullable) NSString* thumbnail;
@property(nonatomic,assign) BOOL is_featured;
@property(nonatomic,assign) NSInteger comment_count;
@property(nonatomic,assign) NSInteger like_count;
@property(nonatomic,assign) BOOL liked;
@property(nonatomic,strong,nullable) WXHSubject* subject;
@property(nonatomic,strong,nullable) WXHUser* user;
@property(nonatomic,strong,nullable) WXHAuthorInfo* author_info;
@property(nonatomic,assign) long created_at;

@end
