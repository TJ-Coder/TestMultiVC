//
//  TJOneVCController.h
//  MVVMTest
//
//  Created by TJian on 2017/9/9.
//  Copyright © 2017年 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TJTourTabPresenter.h"

@interface TJOneVCController : NSObject

+(instancetype)instanceTJOneVCControllerWithSomeParameters:(TJTourTabPresenter *)tourTabPresenter;

-(TJTourTabPresenter *)tabViewPresenter;

-(UITableView *)tableView;


@end
