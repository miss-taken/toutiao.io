//
//  WXHSubject.h
//  toutiao.io
//
//  Created by Apple on 16/3/22.
//  Copyright © 2016年 wxh. All rights reserved.
//

#import <JSONModel.h>

@interface WXHSubject : JSONModel

@property(nonatomic,assign) long subjectId;
@property(nonatomic,strong,nullable) NSString* name;
@property(nonatomic,strong,nullable) NSString<Optional>* image;

@end
