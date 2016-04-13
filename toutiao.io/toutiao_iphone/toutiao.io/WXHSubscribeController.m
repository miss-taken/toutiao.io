//
//  WXHSubscribeController.m
//  toutiao.io
//
//  Created by Apple on 16/3/23.
//  Copyright © 2016年 wxh. All rights reserved.
//

#import "WXHSubscribeController.h"

@interface WXHSubscribeController ()

@end

@implementation WXHSubscribeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.tabBarController.title = @"订阅";
}

@end
