//
//  TJTestTableHeaderView.h
//  MVVMTest
//
//  Created by TJian on 2017/9/8.
//  Copyright © 2017年 Personal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TJTestTableHeaderView : NSObject

+(instancetype)instanceTJTestTableHeaderViewWithImgView:(UIImageView *)imgv;

+(instancetype)instanceTJTestTableHeaderViewWithimgName:(NSString *)imagName;

-(void)didScroller:(UIScrollView *)scroller;

-(UIView *)topView;


@end
