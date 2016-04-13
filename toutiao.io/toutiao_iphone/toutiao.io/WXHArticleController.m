//
//  WXHArticleControllerTable.m
//  toutiao.io
//
//  Created by Apple on 16/3/24.
//  Copyright © 2016年 wxh. All rights reserved.
//

#import "WXHArticleController.h"
#import <libxml/HTMLparser.h>
#import "TFHpple.h"

#import "WXH_APIClient.h"
@interface WXHArticleController ()<UIWebViewDelegate>

@property(nonatomic,strong) UIWebView *contentView;

@end

@implementation WXHArticleController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.article.title;
    self.view.backgroundColor = [UIColor whiteColor];
    [self configureView];
    [self loadArticle];
//    AFHTTPRequestOperationManager *requestManager = [AFHTTPRequestOperationManager manager];
//    requestManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    [requestManager GET:self.article.original_url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        
//        NSString *str = [[NSString alloc] initWithData:[NSData dataWithData:responseObject] encoding:NSUTF8StringEncoding];
//        NSLog(@"%@",str);
//
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        NSLog(@"%@",error);
//    }];
    
    [self testparser];
}

-(void)configureView{
    [self.view addSubview:self.contentView = [[UIWebView alloc] init]];
    self.contentView.delegate = self;
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide).offset(-64);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
}

-(void)loadArticle{
    NSURL *url = [NSURL URLWithString:self.article.original_url];
    
    [self.contentView loadRequest:[[NSURLRequest alloc] initWithURL:url]];
    
}

#pragma -mark WebViewDelegate

-(void)webViewDidStartLoad:(UIWebView *)webView{
    NSLog(@"webViewDidStartLoad...");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView{
    NSLog(@"webViewDidFinishLoad...");
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    NSLog(@"didFailLoadWithError...");

}
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}


- (void) testparser{
    //    NSString *htmlString=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"https://cap.cityu.edu.hk/default.aspx"] encoding: NSUTF8StringEncoding error:nil];
    NSString *htmlString=[NSString stringWithContentsOfURL:[NSURL URLWithString: @"http://www.cwb.gov.tw/eng/index.htm"] encoding: NSUTF8StringEncoding error:nil];
    NSData *htmlData=[htmlString dataUsingEncoding:NSUTF8StringEncoding];
    TFHpple *xpathParser = [[TFHpple alloc] initWithHTMLData:htmlData];
    NSArray *elements  = [xpathParser searchWithXPathQuery:@"//title"]; // get the title
    //NSArray *elements  = [xpathParser searchWithXPathQuery:@"//td[@class='compact']/a"];
    TFHppleElement *element = [elements objectAtIndex:0];
    NSString *elementContent = [element content];
    NSLog(@"result = %@",elementContent);
}

@end
