//
//  TJTestHeaderView.h
//  MVVMTest
//
//  Created by TJian on 2017/9/8.
//  Copyright © 2017年 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TJTestHeaderViewDelegate <NSObject>

-(void)didjumptoIndex:(NSInteger)index;

@end

@interface TJTestHeaderView : UITableViewHeaderFooterView

@property(nonatomic,weak)id<TJTestHeaderViewDelegate> delegate;


-(void)jumpIndexAt:(NSInteger)index;


@end
