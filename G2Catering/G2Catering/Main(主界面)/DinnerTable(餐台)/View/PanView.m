//
//  PanView.m
//  G2Catering
//
//  Created by lcc on 16/6/29.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "PanView.h"

@interface PanView ()
@property (nonatomic,strong)UILabel *messageLabel;
@end

@implementation PanView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
        [self showView];
    }
    return self;
}

-(void)showView
{
    

    
}

@end
