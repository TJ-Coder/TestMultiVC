//
//  TJMultibleViewController.m
//  MVVMTest
//
//  Created by TJian on 2017/9/8.
//  Copyright © 2017年 Personal. All rights reserved.
//

#import "TJMultibleViewController.h"
#import "TJMutibleCollectionViewContrller.h"
#import "TJContentOneViewController.h"

@interface TJMultibleViewController ()

@property(nonatomic,strong)TJMutibleCollectionViewContrller *multiVC;

@end

@implementation TJMultibleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configuration];
    
    [self addUI];
    
}
-(void)configuration{
       self.navigationItem.title = @"TestMultiVC";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
//    self.navigationController.navigationBar.hidden = YES;
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    TJContentOneViewController *oneVc = [[TJContentOneViewController alloc] init];
    UIViewController *oneVc1 = [[UIViewController alloc] init];
    UIViewController *oneVc2 = [[UIViewController alloc] init];
    UIViewController *oneVc3 = [[UIViewController alloc] init];
    
    NSArray *vcs = @[oneVc,oneVc1,oneVc2,oneVc3];
    
    self.multiVC  = [TJMutibleCollectionViewContrller instanceMutibleTableViewContrllerWithViewControllers:vcs superVC:self];
}

-(void)addUI {
 
    [self.view addSubview:self.multiVC.tab];
    
    [self.view addSubview:self.multiVC.alphaNavigationView];
}

@end
