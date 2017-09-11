//
//  TJOneTableViewCell.m
//  MVVMTest
//
//  Created by TJian on 2017/9/9.
//  Copyright © 2017年 Personal. All rights reserved.
//

#import "TJOneTableViewCell.h"

@interface TJOneTableViewCell ()

@property(nonatomic,strong)UILabel *lab;

@property(nonatomic,strong)UILabel *labIntro;

@property(nonatomic,strong)UILabel *countryLab;

@end

@implementation TJOneTableViewCell

//赋值
-(void)setCellPresenter:(TourCellPrensent *)cellPresenter{
    
    _cellPresenter = cellPresenter;
    
    self.lab.text = cellPresenter.userlevel;
    self.labIntro.text = cellPresenter.introduce;
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        UILabel *(^CreateLabe)(UIColor *,CGRect,NSTextAlignment) = ^(UIColor *color,CGRect rect,NSTextAlignment alig) {
            UILabel *lable = [[UILabel alloc] initWithFrame:rect];
            lable.textColor = color;
            lable.textAlignment = alig;
            return lable;
        };
        
        self.lab = CreateLabe([UIColor darkGrayColor],CGRectMake(10, 0, 30, 44),NSTextAlignmentLeft);
        
        self.labIntro = CreateLabe([UIColor redColor],CGRectMake(100, 0, 200, 44),NSTextAlignmentLeft);
        
        self.countryLab = CreateLabe([UIColor purpleColor],CGRectMake(60, 0, 80, 44),NSTextAlignmentLeft);
        
        [self.contentView addSubview:self.lab];
        
        [self.contentView addSubview:self.labIntro];
        
        [self.contentView addSubview:self.countryLab];
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
