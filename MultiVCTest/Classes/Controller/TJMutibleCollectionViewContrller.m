//
//  TJMutibleCollectionViewContrller.m
//  MVVMTest
//
//  Created by TJian on 2017/9/8.
//  Copyright © 2017年 Personal. All rights reserved.
//

#import "TJMutibleCollectionViewContrller.h"
#import "TJTestTableHeaderView.h"
#import "TJTestTableViewCell.h"

#import "TJTestHeaderView.h"
#import "UIView+HSExtension.h"

#define RandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]

@interface TJMutibleCollectionViewContrller ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,TJTestHeaderViewDelegate>

@property(nonatomic,strong)NSArray<UIViewController *> *multibleVCs;

@property(nonatomic,strong)UIViewController *superVc;

@property(nonatomic,strong)UITableView *multibleTableView;

@property(nonatomic,strong)UIView *tableHeader;

@property(nonatomic,strong)TJTestTableHeaderView *headerVc;

@property(nonatomic,strong)UIView *navi;

@property(nonatomic,strong)UIScrollView *contentScrollerView;

@property(nonatomic,strong)NSArray<UIViewController *> *vcs;


@property(nonatomic,strong)TJTestHeaderView *headrView;
@end

@implementation TJMutibleCollectionViewContrller

-(CGFloat)topViewHeight{
    return 300;
}

static NSString *CellID = @"CellID";
static NSString *HeaderID = @"HeaderID";

-(instancetype)initWithMutibleTableViewContrllerWithViewControllers:(NSArray *)vcs superVC:(UIViewController *)viewController{
    
    if (self = [super init]) {
        
        self.vcs = vcs;
        
        self.headerVc = [TJTestTableHeaderView instanceTJTestTableHeaderViewWithimgName:@"test"];
        
        [self makeView];
        
        self.multibleTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, [UIScreen mainScreen].bounds.size.height) style:UITableViewStylePlain];
        
        self.multibleTableView.backgroundColor = [UIColor whiteColor];
        
        self.multibleTableView.dataSource = self;
        self.multibleTableView.delegate = self;
//        self.multibleTableView.pagingEnabled = YES;
//         self.multibleTableView.transform = CGAffineTransformMakeRotation(-M_PI / 2);
        self.contentScrollerView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 375.0, [UIScreen mainScreen].bounds.size.height -108)];
        self.contentScrollerView.pagingEnabled = YES;
//        self.contentScrollerView.scrollEnabled = NO;
        
        self.contentScrollerView.backgroundColor = [UIColor purpleColor];
        self.contentScrollerView.contentSize = CGSizeMake(375 * 4, 0);
        self.contentScrollerView.delegate = self;
        [self.multibleTableView setContentSize:CGSizeMake(0, 264 + [UIScreen mainScreen].bounds.size.height -64)];

//        self.multibleTableView.transform  = CGAffineTransformMakeRotation(-M_PI / 2);
        
        self.multibleTableView.bounces = YES;
        
        self.multibleTableView.tableHeaderView = self.headerVc.topView;
        
        [self.multibleTableView registerClass:[TJTestTableViewCell class] forCellReuseIdentifier:CellID];
        
        [self.multibleTableView registerClass:[TJTestHeaderView class] forHeaderFooterViewReuseIdentifier:HeaderID];
        
         [self switchControllerWithindex:0 vctype:0];
    }
    return self;
}

-(void)makeView{
    self.navi = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, 64)];
    UILabel *ti  = [[UILabel alloc] initWithFrame:self.navi.bounds];
    ti.text = @"Test";
    ti.textAlignment = NSTextAlignmentCenter;
    ti.textColor = [UIColor whiteColor];
    [self.navi addSubview:ti];
}


-(UITableView *)tab{

    return self.multibleTableView;
}


-(UIView *)alphaNavigationView{
    
    return self.navi;

}

#pragma mark - UITableViewDelegate,UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 44;
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    _headrView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:HeaderID];
    
    _headrView.delegate = self;
    
    return _headrView;
}

#pragma mark - TJTestHeaderViewDelegate
-(void)didjumptoIndex:(NSInteger)index{  // 按钮点击状态下
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.25 animations:^{
        [self.contentScrollerView setContentOffset:CGPointMake(index * weakSelf.contentScrollerView.frame.size.width, weakSelf.contentScrollerView.contentOffset.y) animated:YES];
    }];
    
    //===
    [self switchControllerWithindex:index vctype:index];
}

-(void)switchControllerWithindex:(NSInteger)index vctype:(NSInteger)vcType{
    
    UIViewController *vc = (UIViewController *)self.vcs[index];
    vc.view.backgroundColor = RandomColor;
    vc.view.hs_y = 0;
    vc.view.hs_width = self.contentScrollerView.hs_width;
    vc.view.hs_height = self.contentScrollerView.hs_height;
    vc.view.hs_x = vc.view.hs_width * index;
    
    [self.contentScrollerView addSubview:vc.view];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return [UIScreen mainScreen].bounds.size.height - 108;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    TJTestTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    [cell.contentView addSubview:self.contentScrollerView];

    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
   
    int index = scrollView.contentOffset.x / scrollView.frame.size.width;
    
    NSLog(@"index = %zd",index);
    // 导航栏设置
    CGFloat yOffset = scrollView.contentOffset.y;
    
    if (yOffset < 200) {
        CGFloat alpha = yOffset / 200;
        self.navi.backgroundColor =  [UIColor colorWithRed:74/255.0 green:163/255.0 blue:243/255.0 alpha:alpha] ;//UIColor.RGB_COLOR(74, g: 163, b: 243, alpha: alpha)
    }else{
        self.navi.backgroundColor =  [UIColor colorWithRed:74/255.0 green:163/255.0 blue:243/255.0 alpha:1] ;//UIColor.RGB_COLOR(74, g: 163, b: 243, alpha: alpha)
    }
    
    [self.headerVc didScroller:scrollView];
}


#pragma mark - <UIScrollViewDelegate>
- (void)scrollViewDidEndDecelerating:(nonnull UIScrollView *)scrollView{
    
    int index = scrollView.contentOffset.x / scrollView.frame.size.width;

    if (scrollView == self.contentScrollerView) {
        [self switchControllerWithindex:index vctype:1];
        [self.headrView jumpIndexAt:index];
}
    
}

- (void)scrollViewDidEndScrollingAnimation:(nonnull UIScrollView *)scrollView
{
    if (scrollView == self.contentScrollerView) {

        [self switchControllerWithindex:(int)(scrollView.contentOffset.x / scrollView.frame.size.width) vctype:(int)(scrollView.contentOffset.x / scrollView.frame.size.width)];
    }
    
}


+(instancetype)instanceMutibleTableViewContrllerWithViewControllers:(NSArray *)vcs superVC:(UIViewController *)viewController{
    
    return [[TJMutibleCollectionViewContrller alloc] initWithMutibleTableViewContrllerWithViewControllers:vcs superVC:viewController];
}


@end
