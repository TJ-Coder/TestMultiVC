//
//  TourCellPrensent.h
//  MVVMTest
//
//  Created by TJian on 2017/9/9.
//  Copyright © 2017年 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TourModel.h"

@interface TourCellPrensent : NSObject

//cell 逻辑处理数据
-(void)didSelectedCellAtIndexPath:(NSIndexPath *)indexPath completionHandler:(void(^)(id data,NSError *error))completionhandler;

+(instancetype)tourCellPresentWithModel:(TourModel *)tourModel;

-(NSString *)userlevel;

-(NSString *)introduce;

-(NSString *)countryLab;

@end
