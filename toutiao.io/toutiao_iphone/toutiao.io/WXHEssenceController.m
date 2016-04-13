//
//  WXHEssenceController.m
//  toutiao.io
//
//  Created by Apple on 16/3/23.
//  Copyright © 2016年 wxh. All rights reserved.
//

#import "WXHEssenceController.h"
#import "WXHArticleController.h"

#import "WXHEssenceResponse.h"
#import "WXH_APIClientManager.h"
#import "WXHTEssenceCell.h"

@interface WXHEssenceController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *tablView;
@property (nonatomic,strong) NSMutableArray<WXHEssenceData*>* essences;

@end

@implementation WXHEssenceController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _essences  = [NSMutableArray array];
    self.tablView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    
    self.tablView.delegate = self;
    self.tablView.dataSource = self;
    [self.view addSubview:self.tablView];
    
    [self.tablView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_topLayoutGuide);
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
    }];
    
    [self.tablView registerClass:[WXHTEssenceCell class] forCellReuseIdentifier:NSStringFromClass([WXHTEssenceCell class])];
    
    [self requestLastestShare];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.tabBarController.title = @"开发者头条";
}


#pragma -mark UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return self.essences.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
   
    return self.essences[section].article.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WXHTEssenceCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([WXHTEssenceCell class])];
    WXHArticle* artile = self.essences[indexPath.section].article[indexPath.row];
    [cell setArticle:artile];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
}

#pragma -mark UITableViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WXHArticleController *articleVC = [[WXHArticleController alloc] init];
    [articleVC setArticle:self.essences[indexPath.section].article[indexPath.row]];
    [self.navigationController pushViewController:articleVC animated:YES];
}

-(void)requestLastestShare{
    
    [[WXH_APIClientManager shareInstance] requestLastestEssenceWithSuccBlock:^(id responseObject) {
        NSError *error;
        WXHEssenceResponse *essenceResponse = [[WXHEssenceResponse alloc] initWithDictionary:responseObject error:&error];
        if (!error) {
            [self.essences addObject:essenceResponse.data];
        }
        [self.tablView reloadData];
        
    } andFailedBlock:^(NSString *errorInfo, HttpFailedType failedType) {
        NSLog(@"requestFailed ... ");
    }];
}

@end
