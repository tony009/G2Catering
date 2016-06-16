//
//  CheDanView.m
//  G2Catering
//
//  Created by iOS  on 16/6/16.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "CheDanView.h"

@implementation CheDanView


-(void)awakeFromNib{
    
    [self setRoundAngleWithView:self.bgView withCornerRadius:5 withColor:[UIColor clearColor]];
    
    
}
//设置圆角
- (void)setRoundAngleWithView:(UIView *)changeView withCornerRadius:(double)cornerRadius withColor:(UIColor *)color{
    
    changeView.layer.masksToBounds = YES;
    changeView.layer.cornerRadius = cornerRadius;
    changeView.layer.borderColor = color.CGColor;
    changeView.layer.borderWidth = 1;
    
}

- (IBAction)cancelAction:(id)sender {
    if([self.delegate respondsToSelector:@selector(CheDanViewDidCancel:)]){
        
        [self.delegate CheDanViewDidCancel:self];
        
    }
}

- (IBAction)yesAction:(id)sender {
    if([self.delegate respondsToSelector:@selector(CheDanViewDidYes:)]){
        
        [self.delegate CheDanViewDidYes:self];
        
    }
}



@end
