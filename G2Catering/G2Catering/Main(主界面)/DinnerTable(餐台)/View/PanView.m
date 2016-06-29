//
//  PanView.m
//  G2Catering
//
//  Created by lcc on 16/6/29.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "PanView.h"

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
    
//    NSArray *imaArray = @[@"餐台状态_换桌",@"餐台状态_打印按钮",@"餐台状态_结算按钮",@"餐台状态_并桌"];
//    for (int i =0; i<imaArray.count; i++) {
//        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//        btn.tag = kBtnTag+i;
//        
//        [btn setBackgroundImage:[UIImage imageNamed:imaArray[i]] forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(btnMethod:) forControlEvents:UIControlEventTouchUpInside];
//        [self addSubview:btn];
//    }
    
}

@end
