//
//  TJHeaderVC.m
//  MVVMTest
//
//  Created by TJian on 2017/9/8.
//  Copyright © 2017年 Personal. All rights reserved.
//

#import "TJHeaderVC.h"

#import <Masonry.h>

@interface TJHeaderVC ()

@property(nonatomic,strong)UIView *titlesView;

@property(nonatomic,weak)UIButton *selectedButton;

@end

@implementation TJHeaderVC

-(instancetype)initWithMutiblevcsWithArr:(NSArray *)arr WithTableview:(UITableView *)tab{
    
    if (self = [super init]) {
        self.headerView = [tab dequeueReusableHeaderFooterViewWithIdentifier:@"lqc"];
        self.titlesView = [[UIView alloc] init];
        _titlesView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        _titlesView.frame = CGRectMake(0,0, 375, 44);
        [self.headerView addSubview:self.titlesView];
        [self configuration];
    
    }
    return self;
}

-(void)configuration{
    
    UIButton *button =  [self setupTitleButton:@"向导" ];
    [self setupTitleButton:@"用车"];
    [self setupTitleButton:@"体验"];
    [self setupTitleButton:@"住宿"];
    [self titleClick:button];
}

#pragma mark - 设置用车 向导 按钮！
- (UIButton *)setupTitleButton:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [button.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
    [self.titlesView addSubview:button];
    
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(self.titlesView).multipliedBy(0.25);
        make.top.bottom.equalTo(self.titlesView);
        
        NSUInteger index = self.titlesView.subviews.count - 1;
        if (index == 0) {
            make.left.equalTo(self.titlesView);
        } else {
            make.left.equalTo([self.titlesView.subviews[index - 1] mas_right]);
        }
    }];
    
    return button;
}

-(void)titleClick:(UIButton *)sender{
    self.selectedButton.enabled = YES;
    sender.enabled = NO;
    self.selectedButton = sender;
    
    

}

+(instancetype)instanceMutiblevcsWithArr:(NSArray *)arr WithTableview:(UITableView *)tab{
    
    return [[TJHeaderVC alloc] initWithMutiblevcsWithArr:arr WithTableview:tab];
    
}

@end
