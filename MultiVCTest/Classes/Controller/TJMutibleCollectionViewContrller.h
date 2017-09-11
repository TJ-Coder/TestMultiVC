//
//  TJMutibleCollectionViewContrller.h
//  MVVMTest
//
//  Created by TJian on 2017/9/8.
//  Copyright © 2017年 Personal. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ViewControllerType){
    
    ViewControllerTypeGuide,
    ViewControllerTypeCar,
    ViewControllerExpirience,
    expirienceAccomodation
};

@interface TJMutibleCollectionViewContrller : NSObject

+(instancetype)instanceMutibleTableViewContrllerWithViewControllers:(NSArray *)vcs superVC:(UIViewController *)viewController;

-(CGFloat)topViewHeight;

-(UITableView *)tab;

-(UIView *)alphaNavigationView;

@property(nonatomic,strong)UICollectionView *collectionVw;

@end
