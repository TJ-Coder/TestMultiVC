//
//  UIView+HSExtension.m
//  MineTest
//
//  Created by TJian on 2017/3/10.
//  Copyright © 2017年 湖南一块么网络科技有限公司. All rights reserved.
//

#import "UIView+HSExtension.h"

@implementation UIView (HSExtension)

-(void)setHs_x:(CGFloat)hs_x
{
    CGRect frame = self.frame;
    frame.origin.x = hs_x;
    self.frame = frame;
}

-(void)setHs_y:(CGFloat)hs_y
{
    CGRect frame = self.frame;
    frame.origin.y = hs_y;
    self.frame = frame;
}

-(void)setHs_width:(CGFloat)hs_width
{
    CGRect frame = self.frame;
    frame.size.width = hs_width;
    self.frame = frame;
}

-(void)setHs_height:(CGFloat)hs_height
{
    CGRect frame = self.frame;
    frame.size.height = hs_height;
    self.frame = frame;
}

-(CGFloat)hs_x
{
    return self.frame.origin.x;
}

-(CGFloat)hs_y
{
    return self.frame.origin.y;
}

-(CGFloat)hs_width
{
    return self.frame.size.width;
}

-(CGFloat)hs_height
{
    return self.frame.size.height;
}

-(void)setHs_centerX:(CGFloat)hs_centerX
{
    CGPoint center = self.center;
    center.x = hs_centerX;
    self.center = center;
}

-(void)setHs_centerY:(CGFloat)hs_centerY
{
    CGPoint center = self.center;
    center.y = hs_centerY;
    self.center = center;
}

-(CGFloat)hs_centerX
{
    return self.center.x;
}

-(CGFloat)hs_centerY
{
    return self.center.y;
}

@end
