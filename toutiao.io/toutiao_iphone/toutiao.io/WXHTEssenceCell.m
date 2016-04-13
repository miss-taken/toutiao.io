//
//  WXHTEssenceCell.m
//  toutiao.io
//
//  Created by Apple on 16/3/23.
//  Copyright © 2016年 wxh. All rights reserved.
//

#import "WXHTEssenceCell.h"

@interface WXHTEssenceCell ()

@property(nonatomic,strong) UILabel *lb_title;
@property(nonatomic,strong) UILabel *lb_praise;
@property(nonatomic,strong) UILabel *lb_comment;
@property(nonatomic,strong) UILabel *lb_subject;
@property(nonatomic,strong) UIImageView *iv_userHead;
@property(nonatomic,strong) UIButton* btn_praise;
@property(nonatomic,strong) UIImageView* iv_comment; // 评论

@end

@implementation WXHTEssenceCell

- (void)awakeFromNib {
    // Initialization code
    
}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.lb_title];
        [self.contentView addSubview:self.lb_praise];
        [self.contentView addSubview:self.lb_comment];
        [self.contentView addSubview:self.lb_subject];
        
        [self.contentView addSubview:self.iv_userHead];
        [self.contentView addSubview:self.iv_comment];
        [self.contentView addSubview:self.btn_praise];

    }
    
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.lb_title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(8);
        make.top.equalTo(self.contentView.mas_top).offset(16);
        make.right.equalTo(self.contentView.mas_right).offset(-92);
    }];
    
    [self.iv_userHead mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView.mas_centerY).offset(-10);
        make.right.equalTo(self.contentView.mas_right).offset(-16);
        make.width.equalTo(@(50));
        make.height.equalTo(@(50));
    }];
    
    [self.btn_praise mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView.mas_left).offset(16);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);
        
    }];
    [self.lb_praise mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.btn_praise.mas_right).offset(4);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);
    }];
    [self.iv_comment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.lb_praise.mas_right).offset(8);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);
    }];
    
    [self.lb_comment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iv_comment.mas_right).offset(4);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);
    }];
    [self.lb_subject mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right).offset(-16);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-8);
        make.left.greaterThanOrEqualTo(self.lb_comment.mas_right).offset(16);
    }];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];


}


#pragma -mark dealWithTouchEvent
-(void)dealWithItemGest:(UIGestureRecognizer*) gesture{
    
}


#pragma -mark generallyMethod
- (void)configureCell{
    self.lb_title.text = self.article.title;
    self.lb_praise.text = [@(self.article.like_count) stringValue];
    self.lb_comment.text = [@(self.article.comment_count) stringValue];
    self.lb_subject.text = [NSString stringWithFormat:@"选自%@",self.article.subject.name];
    [self.contentView setNeedsLayout];
}

#pragma -mark getter-setter
-(UILabel *)lb_title{
    if (!_lb_title) {
        _lb_title = [[UILabel alloc] init];
        _lb_title.numberOfLines = 0;
        _lb_title.lineBreakMode = NSLineBreakByWordWrapping;
        _lb_title.font = [UIFont systemFontOfSize:14];
//        _lb_title.highlightedTextColor = [UIColor blackColor];
//        _lb_title.textColor = [UIColor grayColor];
    }
    return _lb_title;
}
-(UILabel *)lb_praise{
    if (!_lb_praise) {
        _lb_praise = [[UILabel alloc] init];
        _lb_praise.textColor = [UIColor grayColor];
        _lb_praise.font = [UIFont systemFontOfSize:12];
    }
    return _lb_praise;
}
-(UILabel *)lb_comment{
    
    if (!_lb_comment) {
        _lb_comment = [[UILabel alloc] init];
        _lb_comment.textColor = [UIColor grayColor];
        _lb_comment.font = [UIFont systemFontOfSize:12];

    }
    return _lb_comment;
}

-(UILabel *)lb_subject{
    
    if (!_lb_subject) {
        _lb_subject = [[UILabel alloc] init];
        _lb_subject.textColor = [UIColor grayColor];
        _lb_subject.font = [UIFont systemFontOfSize:12];
    }
    return _lb_subject;
}

-(UIButton *)btn_praise{
    if (!_btn_praise) {
        _btn_praise = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btn_praise setImage:[UIImage imageNamed:@"btn_praise_normal"] forState:UIControlStateNormal];
        [_btn_praise setImage:[UIImage imageNamed:@"btn_praise_highlight"] forState:UIControlStateSelected];
    }
    return _btn_praise;
}

-(UIImageView *)iv_userHead{
    if (!_iv_userHead) {
        _iv_userHead = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon_userHead"]];
        _iv_userHead.userInteractionEnabled = YES;
        
        [_iv_userHead addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealWithItemGest:)]];
        _iv_userHead.layer.cornerRadius = 25;
        _iv_userHead.layer.masksToBounds = YES;
    }
    return _iv_userHead;
}

-(UIImageView *)iv_comment{
    if (!_iv_comment) {
        _iv_comment = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn_comment_normal"]];
        _iv_comment.userInteractionEnabled = YES;
        [_iv_comment addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dealWithItemGest:)]];
    }
    return _iv_comment;
}


-(void)setArticle:(WXHArticle *)article{
    _article = article;
    [self configureCell];
}


@end
