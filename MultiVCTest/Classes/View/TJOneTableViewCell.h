//
//  TJOneTableViewCell.h
//  MVVMTest
//
//  Created by TJian on 2017/9/9.
//  Copyright © 2017年 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TourCellPrensent.h"

typedef void(^CellBlockTest)(NSString *name,NSInteger index);

@interface TJOneTableViewCell : UITableViewCell

@property(nonatomic,strong)TourCellPrensent *cellPresenter;


//绑定cell 的某一个事件等等
@property(nonatomic,copy)CellBlockTest cellBlock;



@end
