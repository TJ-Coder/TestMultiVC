//
//  TourModel.h
//  MVVMTest
//
//  Created by TJian on 2017/9/6.
//  Copyright © 2017年 Personal. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
{    "uid": "c7e72fc48adc11e7b3f11051721b40df",
    "areacode": "60",
    "jobname": "包车服务",
    "price": 250.0,
    "contry": "马来西亚",
    "state": "吉隆坡",
    "tourgoodstype": "接送机,潜水,向导服务,当地口味",
    "maxpep": 9,
    "photopath": "http://hailtour.yikuai.me/LifeImg/2017/08/28/20/72763219.jpg",
    "userlevel": 0.0000,
    "cellphone": "125103005",
    "headimg": "http://hailtour.yikuai.me/HeadImg/2017/08/28/10/79424274.jpg",
    "niname": "阿彪",
    "niname": "蔡永彪",
    "sex": 1,
    "age": "80后",
    "introduce": "",
    "onword": "资深吃货,夜店我最热,书虫",
    "commitcount": 0,    "counts": 0  
}
*/
@interface TourModel : NSObject

@property(nonatomic,strong)NSNumber *contry;

@property(nonatomic,strong)NSNumber *userlevel;

@property(nonatomic,strong)NSNumber *cellphone;

@property(nonatomic,strong)NSNumber *headimg;

@property(nonatomic,strong)NSNumber *niname;

@property(nonatomic,strong)NSNumber *sex;

@property(nonatomic,strong)NSNumber *introduce;

+(instancetype)instanceTourModelWithDict:(NSDictionary *)dict;

-(instancetype)initTourModelWithDict:(NSDictionary *)dict;

@end
