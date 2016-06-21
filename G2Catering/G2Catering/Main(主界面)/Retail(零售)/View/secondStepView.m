//
//  secondStepView.m
//  G2Catering
//
//  Created by iOS  on 16/6/21.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "secondStepView.h"

@implementation secondStepView


-(void)awakeFromNib{
    
   [self setRoundAngleWithView:self.cancelBtn withCornerRadius:5 withColor:[UIColor colorWithRed:42/255.0 green:66/255.0 blue:90/255.0 alpha:1]];
  [self setRoundAngleWithView:self.yesBtn withCornerRadius:5 withColor:[UIColor colorWithRed:42/255.0 green:66/255.0 blue:90/255.0 alpha:1]];
    [_cancelBtn addTarget:self action:@selector(cancelAction:) forControlEvents:UIControlEventTouchUpInside];
     [_yesBtn addTarget:self action:@selector(yesAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)cancelAction:(UIButton *)cancelBtn{
    
    if (self.block) {
        self.block(NO);
    }
    
}

- (void)yesAction:(UIButton *)yesBtn{
    
    
    if (self.block) {
        self.block(YES);
    }
    
}
//设置圆角
- (void)setRoundAngleWithView:(UIView *)changeView withCornerRadius:(double)cornerRadius withColor:(UIColor *)color{
    
    changeView.layer.masksToBounds = YES;
    changeView.layer.cornerRadius = cornerRadius;
    changeView.layer.borderColor = color.CGColor;
    changeView.layer.borderWidth = 1;
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
