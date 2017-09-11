//
//  TourModel.m
//  MVVMTest
//
//  Created by TJian on 2017/9/6.
//  Copyright © 2017年 Personal. All rights reserved.
//

#import "TourModel.h"

@implementation TourModel

-(instancetype)initTourModelWithDict:(NSDictionary *)dict{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+(instancetype)instanceTourModelWithDict:(NSDictionary *)dict{
    return [[TourModel alloc] initTourModelWithDict:dict];
}

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{

}

@end
