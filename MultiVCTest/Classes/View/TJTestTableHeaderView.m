//
//  TJTestTableHeaderView.m
//  MVVMTest
//
//  Created by TJian on 2017/9/8.
//  Copyright © 2017年 Personal. All rights reserved.
//

#import "TJTestTableHeaderView.h"

@interface TJTestTableHeaderView ()

@property(nonatomic,strong)UIView *headerview;

@property(nonatomic,strong)UIImageView *imagVw;

@property(nonatomic,assign)NSInteger imageHeight;

@end

@implementation TJTestTableHeaderView
{
    CGFloat _ratio;
    CGRect _originalrect;

}
-(instancetype)initTJTestTableHeaderViewWithImgView:(UIImageView *)imgv{

    if (self = [super init]) {
        
        _imageHeight = 262;
        _headerview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, _imageHeight)];
        
        
        _imagVw = imgv;
        _originalrect = imgv.frame;
        _ratio = imgv.frame.size.height / imgv.frame.size.width;
    }
    return self;
}

+(instancetype)instanceTJTestTableHeaderViewWithImgView:(UIImageView *)imgv{
    
    return [[TJTestTableHeaderView alloc] initTJTestTableHeaderViewWithImgView:imgv];
}

-(instancetype)initWithTJTestTableHeaderViewWithimgName:(NSString *)imagName{
    
    if (self = [super init]) {
        _imageHeight = 264;
        
        self.headerview = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 375, _imageHeight)];
        
        self.imagVw = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imagName]];
        _ratio = _imageHeight / 375;
        self.imagVw.frame = self.headerview.bounds;
        [self.headerview addSubview:self.imagVw];
        _originalrect = self.headerview.bounds;
        
    }
    return self;
}

+(instancetype)instanceTJTestTableHeaderViewWithimgName:(NSString *)imagName{
    
    return [[TJTestTableHeaderView alloc] initWithTJTestTableHeaderViewWithimgName:imagName];
}

-(UIView *)topView{
    
    return self.headerview;
}

-(void)didScroller:(UIScrollView *)scroller{
    
    CGFloat offsetY = scroller.contentOffset.y;
    
    if (offsetY > 0 ) { //往上移动
//        CGRect frame = _originalrect;
//        frame.origin.y = _originalrect.origin.y - offsetY;
//        self.imagVw.frame = frame;
        
    }else{ //scroll down
        
        CGFloat width = 375.0;
        CGFloat totalOffset = _imageHeight + ABS(offsetY);
        CGFloat ratio = totalOffset / _imageHeight;
        self.imagVw.frame = CGRectMake(- (width * ratio - width) / 2, offsetY, width * ratio, totalOffset); //拉伸后的图片的frame应该是同比例缩放。
        
//        CGRect frame = _originalrect;
//        
//        frame.size.height = _originalrect.size.height - offsetY;
//        frame.size.width = frame.size.height / _ratio;
//        
//        frame.origin.x = _originalrect.origin.x - (frame.size.width - _originalrect.size.width) * 0.5;
//        
//        NSLog(@"[NSValue valueWithCGRect:frame] = %@",[NSValue valueWithCGRect:frame]);
//        self.imagVw.frame = frame;
        
    }
}


@end
