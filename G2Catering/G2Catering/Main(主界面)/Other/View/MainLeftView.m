//
//  MainLeftView.m
//  G2Catering
//
//  Created by wd on 16/6/13.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "MainLeftView.h"
//#import "JiaoYiJiLuViewController.h"

@implementation MainLeftView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (IBAction)tradeAction:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(MainLeftViewMenuDidChick:withIndex:)]) {
        [self.delegate MainLeftViewMenuDidChick:self withIndex:1];
    }
    
}



@end
