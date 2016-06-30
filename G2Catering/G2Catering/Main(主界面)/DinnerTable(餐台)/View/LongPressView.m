//
//  longPressView.m
//  G2Catering
//
//  Created by tencrwin on 16/6/21.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "LongPressView.h"

@implementation LongPressView

-(void)awakeFromNib
{
//    UIView *bgView = [[UIView alloc] init];
//    bgView.bounds = self.bounds;
//        //        bgView.backgroundColor = RGB(71, 71, 71);
//    bgView.backgroundColor = [UIColor blueColor];
//    bgView.alpha = 0.7;
//    [self addSubview:bgView];
}

- (void)setPoint:(CGPoint)point{
    
    self.changeView.frame = CGRectMake(0, 0, 200, 100);
    self.changeView.center = point;
    self.changeView.center = self.center;
    self.changeView.frame = self.bounds;
    self.changeView.center = self.center;
  
}
- (IBAction)btnMethod:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(btnDelegateMethod:)]) {
        [self.delegate btnDelegateMethod:sender];
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self btnMethod:nil];
}


@end
