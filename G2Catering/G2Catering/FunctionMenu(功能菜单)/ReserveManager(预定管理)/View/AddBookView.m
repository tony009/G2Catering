//
//  AddBookView.m
//  G2Catering
//
//  Created by NDlan on 16/6/16.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "AddBookView.h"

@implementation AddBookView

- (void)awakeFromNib{
    
    self.layer.cornerRadius  = 5;
    self.layer.masksToBounds = YES;
    self.layer.borderColor   = [UIColor lightGrayColor].CGColor;
    self.layer.borderWidth   = 1;
    
    
    
    self.sureBtn.layer.cornerRadius  = 5;
    self.sureBtn.layer.masksToBounds = YES;
    
    self.cancelBtn.layer.cornerRadius  = 5;
    self.cancelBtn.layer.masksToBounds = YES;
    
//    self.gentlemenBtn.layer.cornerRadius  = 5;
    self.gentlemenBtn.layer.masksToBounds = YES;
    self.gentlemenBtn.layer.borderColor   = [UIColor lightGrayColor].CGColor;
    self.gentlemenBtn.layer.borderWidth   = 1;
    
//    self.ladiesBtn.layer.cornerRadius  = 5;
    self.ladiesBtn.layer.masksToBounds = YES;
    self.ladiesBtn.layer.borderColor   = [UIColor lightGrayColor].CGColor;
    self.ladiesBtn.layer.borderWidth   = 1;
    
//    self.hourBtn.layer.cornerRadius  = 5;
    self.hourBtn.layer.masksToBounds = YES;
    self.hourBtn.layer.borderColor   = [UIColor lightGrayColor].CGColor;
    self.hourBtn.layer.borderWidth   = 1;
    
//    self.dayBtn.layer.cornerRadius  = 5;
    self.dayBtn.layer.masksToBounds = YES;
    self.dayBtn.layer.borderColor   = [UIColor lightGrayColor].CGColor;
    self.dayBtn.layer.borderWidth   = 1;
    
    UIRectCorner cornerLeft = UIRectCornerTopLeft | UIRectCornerBottomLeft;
    UIRectCorner cornerRight = UIRectCornerTopRight | UIRectCornerBottomRight;
    
    [self makeLeftCornerRadius:self.gentlemenBtn andWithCorner:cornerLeft];
    [self makeLeftCornerRadius:self.hourBtn andWithCorner:cornerLeft];
    [self makeLeftCornerRadius:self.ladiesBtn andWithCorner:cornerRight];
    [self makeLeftCornerRadius:self.dayBtn andWithCorner:cornerRight];
}

- (void)makeLeftCornerRadius:(UIView *)view andWithCorner:(UIRectCorner)corner{

    CGRect rect = view.bounds;
    CGSize size = CGSizeMake(5, 5);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:corner cornerRadii:size];
    CAShapeLayer *maskLayer = [CAShapeLayer new];
    maskLayer.borderColor = [UIColor lightGrayColor].CGColor;
    maskLayer.path = path.CGPath;
    maskLayer.frame = rect;
    view.layer.mask = maskLayer;

}



@end
