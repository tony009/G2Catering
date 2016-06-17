//
//  DishTypeViewCollectionViewCell.m
//  G2Catering
//
//  Created by wd on 16/6/17.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "DishTypeViewCollectionViewCell.h"

@implementation DishTypeViewCollectionViewCell


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
    
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}

-(void)setUp{
    
    
    self.backgroundColor = [UIColor whiteColor];

    
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomRight cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    
    
    
//    self.btn = [[UIButton alloc]initWithFrame:self.bounds];
//    [self.btn setTitle:@"全部" forState:UIControlStateNormal];
//    [self.btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    
//    [self.btn setTitleEdgeInsets:UIEdgeInsetsMake(20, 20, 20,20 )];
//    self.btn.titleLabel.numberOfLines = 0;
//
//    [self addSubview:self.btn];
    
    self.label  = [[UILabel alloc]initWithFrame:self.bounds];
    //self.label.center = self.center;
    self.label.text = @"全部";
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.numberOfLines = 0;
    [self addSubview:self.label];
    
}

@end
