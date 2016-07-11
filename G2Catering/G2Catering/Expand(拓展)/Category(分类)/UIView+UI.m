//
//  UIView+UI.m
//  G2Catering
//
//  Created by wd on 16/7/5.
//  Copyright © 2016年 NDL. All rights reserved.
//

#define XianColor [UIColor colorWithRed:11.0 /255.0 green:75.0/255.0 blue:162.0/255.0 alpha:1]
#import <Masonry.h>
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

+(void)addQuanxianWithLabel:(UIView *)label {
    UILabel *xian = [UILabel new];
    [label addSubview:xian];
    xian.backgroundColor = XianColor;
    [xian mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.top.equalTo(label.mas_bottom).offset(-1);
        make.height.equalTo(@1);
    }];
}

@end
