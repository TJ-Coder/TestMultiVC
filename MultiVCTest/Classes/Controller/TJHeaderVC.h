//
//  TJHeaderVC.h
//  MVVMTest
//
//  Created by TJian on 2017/9/8.
//  Copyright © 2017年 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TJTestHeaderView.h"

@interface TJHeaderVC : NSObject

@property(nonatomic,strong)TJTestHeaderView *headerView;

+(instancetype)instanceMutiblevcsWithArr:(NSArray *)arr WithTableview:(UITableView *)tab;


@end
