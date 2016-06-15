//
//  EstimateView.m
//  G2Catering
//
//  Created by NDlan on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "EstimateView.h"

@implementation EstimateView

- (void)awakeFromNib{
    
    
    self.bottonBackView.layer.cornerRadius  = 5;
    self.bottonBackView.layer.masksToBounds = YES;
    
    self.middleBackView.layer.cornerRadius  = 5;
    self.middleBackView.layer.masksToBounds = YES;
    
    self.collectionBackView.layer.cornerRadius  = 5;
    self.collectionBackView.layer.masksToBounds = YES;
    
//    CGRect rect = self.btn.bounds;
//    CGSize radio = CGSizeMake(10, 10);
//    UIRectCorner corner = UIRectCornerBottomRight|UIRectCornerTopRight;
//    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:radio];
//    CAShapeLayer *masklayer = [[CAShapeLayer alloc] init];
//    masklayer.frame = self.btn.bounds;
//    masklayer.path = path.CGPath;
//    self.btn.layer.mask = mask layer;
}

@end
