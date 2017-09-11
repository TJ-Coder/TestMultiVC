//
//  TourCellPrensent.m
//  MVVMTest
//
//  Created by TJian on 2017/9/9.
//  Copyright © 2017年 Personal. All rights reserved.
//

#import "TourCellPrensent.h"

@interface TourCellPrensent ()

@property(nonatomic,strong)TourModel *tourModel;

@end

@implementation TourCellPrensent

+(instancetype)tourCellPresentWithModel:(TourModel *)tourModel{
    
    TourCellPrensent *p = [[TourCellPrensent alloc] init];
    p.tourModel = tourModel;
    return p;
}

-(NSString *)countryLab{
    
    return [NSString stringWithFormat:@"%@",self.tourModel.contry];
}

-(NSString *)userlevel{
    return [NSString stringWithFormat:@"%@",self.tourModel.userlevel];
}

-(NSString *)introduce{
    return [NSString stringWithFormat:@"%@",self.tourModel.introduce];
}

-(void)didSelectedCellAtIndexPath:(NSIndexPath *)indexPath completionHandler:(void(^)(id data,NSError *error))completionhandler{
//    [APIManager doSomething];
    !completionhandler ?: completionhandler(@"LQC",nil);

}




@end
