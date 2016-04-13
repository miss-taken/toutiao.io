//
//  WXHUser.h
//  toutiao.io
//
//  Created by Apple on 16/3/22.
//  Copyright © 2016年 wxh. All rights reserved.
//

#import <JSONModel.h>

@interface WXHUser : JSONModel

@property(nonatomic,assign) long userId;
@property(nonatomic,strong,nullable) NSString* name;
@property(nonatomic,strong,nullable) NSString* avatar;
@property(nonatomic,strong,nullable) NSString<Optional>* bio;
@property(nonatomic,assign) BOOL following;

@end
