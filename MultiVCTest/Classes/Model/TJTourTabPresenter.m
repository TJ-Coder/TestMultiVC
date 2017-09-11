//
//  TJTourTabPresenter.m
//  MVVMTest
//
//  Created by TJian on 2017/9/9.
//  Copyright © 2017年 Personal. All rights reserved.
//

#import "TJTourTabPresenter.h"

@interface TJTourTabPresenter ()

@property (strong, nonatomic) NSMutableArray<TourCellPrensent *> *dataArr;

@end

@implementation TJTourTabPresenter


-(void)loadRemoteDataWithCompletionhandler:(void (^)(id data, NSError *error))completionhandler{

    [self.dataArr removeAllObjects];
//    [[APIManager loadddd:(void(^)(NSError *error,id data){
//    
//    
//    })];
    
    //假设返回一些数据吧
    NSArray *dataArr = @[@{
                             @"userlevel":@"3",
                             @"contry":@"中国",
                             @"introduce":@"你好，中国",
                             }
                         ,
                         @{
                             @"userlevel":@"2",
                             @"contry":@"德国",
                             @"introduce":@"你好，德国",
                             },
                         @{
                             @"userlevel":@"8",
                             @"contry":@"印度",
                             @"introduce":@"你好，印度",
                             }
                         ,
                         @{
                             @"userlevel":@"1",
                             @"contry":@"巴西",
                             @"introduce":@"你好，巴西",
                             }
                         ,
                         @{
                             @"userlevel":@"0",
                             @"contry":@"太平洋",
                             @"introduce":@"你好，太平洋",
                             },@{
                             @"userlevel":@"3",
                             @"contry":@"中国",
                             @"introduce":@"你好，中国",
                             }
                         ,
                         @{
                             @"userlevel":@"2",
                             @"contry":@"德国",
                             @"introduce":@"你好，德国",
                             },
                         @{
                             @"userlevel":@"8",
                             @"contry":@"印度",
                             @"introduce":@"你好，印度",
                             }
                         ,
                         @{
                             @"userlevel":@"1",
                             @"contry":@"巴西",
                             @"introduce":@"你好，巴西",
                             }
                         ,
                         @{
                             @"userlevel":@"0",
                             @"contry":@"太平洋",
                             @"introduce":@"你好，太平洋",
                             },@{
                             @"userlevel":@"3",
                             @"contry":@"中国",
                             @"introduce":@"你好，中国",
                             }
                         ,
                         @{
                             @"userlevel":@"2",
                             @"contry":@"德国",
                             @"introduce":@"你好，德国",
                             },
                         @{
                             @"userlevel":@"8",
                             @"contry":@"印度",
                             @"introduce":@"你好，印度",
                             }
                         ,
                         @{
                             @"userlevel":@"1",
                             @"contry":@"巴西",
                             @"introduce":@"你好，巴西",
                             }
                         ,
                         @{
                             @"userlevel":@"0",
                             @"contry":@"太平洋",
                             @"introduce":@"你好，太平洋",
                             },@{
                             @"userlevel":@"3",
                             @"contry":@"中国",
                             @"introduce":@"你好，中国",
                             }
                         ,
                         @{
                             @"userlevel":@"2",
                             @"contry":@"德国",
                             @"introduce":@"你好，德国",
                             },
                         @{
                             @"userlevel":@"8",
                             @"contry":@"印度",
                             @"introduce":@"你好，印度",
                             }
                         ,
                         @{
                             @"userlevel":@"1",
                             @"contry":@"巴西",
                             @"introduce":@"你好，巴西",
                             }
                         ,
                         @{
                             @"userlevel":@"0",
                             @"contry":@"太平洋",
                             @"introduce":@"你好，太平洋",
                             },@{
                             @"userlevel":@"3",
                             @"contry":@"中国",
                             @"introduce":@"你好，中国",
                             }
                         ,
                         @{
                             @"userlevel":@"2",
                             @"contry":@"德国",
                             @"introduce":@"你好，德国",
                             },
                         @{
                             @"userlevel":@"8",
                             @"contry":@"印度",
                             @"introduce":@"你好，印度",
                             }
                         ,
                         @{
                             @"userlevel":@"1",
                             @"contry":@"巴西",
                             @"introduce":@"你好，巴西",
                             }
                         ,
                         @{
                             @"userlevel":@"0",
                             @"contry":@"太平洋",
                             @"introduce":@"你好，太平洋",
                             }
                         ,
                         @{
                             @"userlevel":@"0",
                             @"contry":@"太平洋",
                             @"introduce":@"你好，太平洋",
                             },@{
                             @"userlevel":@"3",
                             @"contry":@"中国",
                             @"introduce":@"你好，中国",
                             }
                         ,
                         @{
                             @"userlevel":@"2",
                             @"contry":@"德国",
                             @"introduce":@"你好，德国",
                             },
                         @{
                             @"userlevel":@"8",
                             @"contry":@"印度",
                             @"introduce":@"你好，印度",
                             }
                         ,
                         @{
                             @"userlevel":@"1",
                             @"contry":@"巴西",
                             @"introduce":@"你好，巴西",
                             }
                         ,
                         @{
                             @"userlevel":@"0",
                             @"contry":@"太平洋",
                             @"introduce":@"你好，太平洋",
                             }
                         ];
    
    [self formatData:dataArr];
    
    //代理方式 通知事件
    if ([self.protocol respondsToSelector:@selector(loadDataProtocolWithTourTabPresenterProtocol:error:data:)]) {
        [self.protocol loadDataProtocolWithTourTabPresenterProtocol:self error:nil data:nil];
    }
}



-(void)formatData:(NSArray *)data {
    
    for (NSDictionary *dict in data) {
        
        TourModel *model = [TourModel instanceTourModelWithDict:dict];

        [self.dataArr addObject:[TourCellPrensent tourCellPresentWithModel:model]];
    }
}

-(NSMutableArray<TourCellPrensent *> *)cellDataArr{

    return self.dataArr;
}


-(instancetype)initTourTabPresenterWithParameters:(id)parameters{

    if (self = [super init]) {
        
        self.dataArr = [NSMutableArray array];
        
    }
    return self;
}

+(instancetype)tourTabPresenterWithParameters:(id)parameters{
    return [[TJTourTabPresenter alloc] initTourTabPresenterWithParameters:parameters];
}

@end
