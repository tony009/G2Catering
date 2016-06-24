//
//  longPressView.m
//  G2Catering
//
//  Created by tencrwin on 16/6/21.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "LongPressView.h"

@implementation LongPressView


- (void)setPoint:(CGPoint)point{
    
    self.changeView.frame = CGRectMake(0, 0, 200, 100);
     self.changeView.center = point;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
