//
//  TJTestHeaderView.m
//  MVVMTest
//
//  Created by TJian on 2017/9/8.
//  Copyright © 2017年 Personal. All rights reserved.
//

#import "TJTestHeaderView.h"
#import <Masonry.h>

@interface TJTestHeaderView ()

@property(nonatomic,strong)UIView *titlesView;

@property(nonatomic,weak)UIButton *selectedButton;

@property(nonatomic,strong)UIView *sliderView;

@property(nonatomic,strong)MASConstraint *sliderViewCenterX;


@end

@implementation TJTestHeaderView

-(instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        self.titlesView = [[UIView alloc] init];
//        self.titlesView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        self.titlesView.frame = CGRectMake(0,0, 375, 44);
        [self addSubview:self.titlesView];
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
    
    _sliderView = [[UIView alloc] init];
    _sliderView.backgroundColor = [UIColor redColor];
    [self.titlesView addSubview:_sliderView];
    
    CGSize size = CGSizeMake([[button titleForState:UIControlStateNormal] sizeWithAttributes:@{NSFontAttributeName : button.titleLabel.font}].width, 2);
    
    [_sliderView mas_makeConstraints:^(MASConstraintMaker *make){
        make.height.equalTo(@(size.height));
        make.width.equalTo(@(size.width));
        make.bottom.equalTo(self.titlesView).offset(-2);
        self.sliderViewCenterX = make.centerX.equalTo(button);
    }];

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

-(void)jumpIndexAt:(NSInteger)index{
    
    UIButton *button = (UIButton *)[self.titlesView.subviews objectAtIndex:index];
    [self titleClick:button];
    
    
    
    if ([self.delegate respondsToSelector:@selector(didjumptoIndex:)]) {
        [self.delegate didjumptoIndex:index];
    }
}

-(void)titleClick:(UIButton *)button{
    self.selectedButton.enabled = YES;
    button.enabled = NO;
    self.selectedButton = button;
    
    // 消除约束
    [self.sliderViewCenterX uninstall];
    self.sliderViewCenterX = nil;
    __weak typeof(self) weakSelf = self;
    
    // 添加约束
    [UIView animateWithDuration:0.25 animations:^{
        [weakSelf.sliderView mas_makeConstraints:^(MASConstraintMaker *make) {
            weakSelf.sliderViewCenterX = make.centerX.equalTo(button);
        }];
        [weakSelf.sliderView.superview layoutIfNeeded];
    }];
    
    NSInteger index = (int)[weakSelf.titlesView.subviews indexOfObject:button];
    
    if ([self.delegate respondsToSelector:@selector(didjumptoIndex:)]) {
        
        [self.delegate didjumptoIndex:index];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
