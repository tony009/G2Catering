//
//  OpenTableButton.m
//  G2Catering
//
//  Created by wd on 16/6/20.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "OpenTableButton.h"

@implementation OpenTableButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return  self;
}

-(void)setUp{
    
    self.layer.cornerRadius = 10;
    self.layer.borderColor = [UIColor grayColor].CGColor;
    self.layer.borderWidth = 1;
    
    
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    //[self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
}


-(void)setSelected:(BOOL)selected{
    //[super setSelected:YES];
    
    if (selected) {
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.backgroundColor = RGB(0x2a, 0x42, 0x5a);
        
    }else{
    
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.backgroundColor = [UIColor whiteColor];
    }
    

    
}
@end
