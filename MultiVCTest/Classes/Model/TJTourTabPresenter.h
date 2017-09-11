//
//  TJTourTabPresenter.h
//  MVVMTest
//
//  Created by TJian on 2017/9/9.
//  Copyright © 2017年 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TourCellPrensent.h"

@class TJTourTabPresenter;

@protocol TJTourTabPresenterProtocol <NSObject>

@optional

-(void)loadDataProtocolWithTourTabPresenterProtocol:(TJTourTabPresenter *)presenter error:(NSError *)error data:(id)data;

@end

@interface TJTourTabPresenter : NSObject

@property(nonatomic,weak)id<TJTourTabPresenterProtocol> protocol;

+ (instancetype)tourTabPresenterWithParameters:(id)parameters;

-(NSMutableArray <TourCellPrensent *>*)cellDataArr;

-(void)loadinitailData;

-(void)refreshData;

-(void)loadRemoteDataWithCompletionhandler:(void(^)(id data,NSError *error))completionhandler;

@end
