//
//  MainRightView.m
//  G2Catering
//
//  Created by wd on 16/6/13.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "MainRightView.h"
#import  "LingShouViewController.h"
@implementation MainRightView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)awakeFromNib{
    
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setUp];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUp];
    }
    return self;
}


-(void)setUp{
    
}

- (IBAction)lingShouAction:(id)sender {
    if([self.delegate respondsToSelector:@selector(MainRightViewMenuDidChick:withIndex:)]){
        
        [self.delegate MainRightViewMenuDidChick:self withIndex:2];
    }
    
}





@end
