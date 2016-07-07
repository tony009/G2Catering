//
//  UIView+UI.m
//  G2Catering
//
//  Created by wd on 16/7/5.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "UIView+UI.h"

@implementation UIView (UI)

-(void)setCornerRadius:(float)cornerRadius
       withBorderWidth:(CGFloat) borderWidth
       withBorderColor:(UIColor *)color{
    
    self.layer.cornerRadius = cornerRadius;
    self.layer.borderColor = color.CGColor;
    self.layer.borderWidth = borderWidth;
    
    self.layer.masksToBounds = YES;
}

@end
