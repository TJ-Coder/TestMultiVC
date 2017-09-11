//
//  TJOneVCController.m
//  MVVMTest
//
//  Created by TJian on 2017/9/9.
//  Copyright © 2017年 Personal. All rights reserved.
//

#import "TJOneVCController.h"
#import "TourModel.h"
#import "TJOneTableViewCell.h"
#import "TourCellPrensent.h"

@interface TJOneVCController ()<TJTourTabPresenterProtocol,UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tab;

@property(nonatomic,strong)NSMutableArray <TourCellPrensent *>*dataArr;

@property(nonatomic,strong)TJTourTabPresenter *tabPresenter;

@end

@implementation TJOneVCController

static NSString *cellID = @"cell";

#pragma mark - UITableViewDelegate & UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.tabPresenter.cellDataArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TourCellPrensent *presenter = self.tabPresenter.cellDataArr[indexPath.row];
    TJOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    // cell 内逻辑
    __weak typeof(cell) weakCell = cell;
    cell.cellBlock = ^(NSString *name, NSInteger index) {
        [weakCell.cellPresenter didSelectedCellAtIndexPath:indexPath completionHandler:^(id data, NSError *error) {
          
      }];
    };
    
    cell.cellPresenter = presenter;
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    TourCellPrensent *presenter = self.tabPresenter.cellDataArr[indexPath.row];
    [presenter didSelectedCellAtIndexPath:indexPath completionHandler:^(id data, NSError *error) {
        
    }];
}


#pragma mark - TJTourTabPresenterProtocol
-(void)loadDataProtocolWithTourTabPresenterProtocol:(TJTourTabPresenter *)presenter error:(NSError *)error data:(id)data{

    if (error) {
            //Show HUD
    }else{
        // Refresh UI
    }
    
    [self.tab reloadData];
}

#pragma mark - 创建 及 初始化
-(instancetype)initTJOneVCControllerWithSomeParameters:(TJTourTabPresenter *)parameters{
    if (self = [super init]) {
        self.tabPresenter = parameters;
        self.tabPresenter.protocol = self;
        self.tab = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 44 - 64) style:UITableViewStylePlain];
        
        self.tab.delegate = self;
        self.tab.dataSource = self;
        
        self.tab.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        [self.tab registerClass:[TJOneTableViewCell class] forCellReuseIdentifier:cellID];
        //这里可以加载上拉 下拉 等等操作
//        self.tab.header ........
        
//        self.tab.footer ....
        
    }
    return self;
}

+(instancetype)instanceTJOneVCControllerWithSomeParameters:(TJTourTabPresenter *)parameters{
    return [[TJOneVCController alloc] initTJOneVCControllerWithSomeParameters:parameters];
}


-(UITableView *)tableView{
    
    return self.tab;
}

-(TJTourTabPresenter *)tabViewPresenter{
    
    return self.tabPresenter;
}

@end
