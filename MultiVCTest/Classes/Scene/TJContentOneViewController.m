//
//  TJContentOneViewController.m
//  MVVMTest
//
//  Created by TJian on 2017/9/8.
//  Copyright © 2017年 Personal. All rights reserved.
//

//#define RandomColor [UIColor colorWithRed:arc4random_uniform(255)/255.0 green:arc4random_uniform(255)/255.0 blue:arc4random_uniform(255)/255.0 alpha:1]
//

#import "TJContentOneViewController.h"
#import "TJOneVCController.h"

@interface TJContentOneViewController ()

@property(nonatomic,strong)TJOneVCController *oneVc;

@end

@implementation TJContentOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //configuRationBlogViewPresenter
    [self configuRation];
    
    
    [self addUI];
    
    
    [self fetchDataRemote];
    
}

-(void)configuRation{
    
  
//    ...........
    self.oneVc = [TJOneVCController instanceTJOneVCControllerWithSomeParameters:[TJTourTabPresenter tourTabPresenterWithParameters:@{@"parameter":@"LQC",@"where":@"buzhi"}]];
}


-(void)addUI{
    [self.view addSubview:self.oneVc.tableView];

}

-(void)fetchDataRemote{

    [self.oneVc.tabViewPresenter loadRemoteDataWithCompletionhandler:^(id data, NSError *error) {
        
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
