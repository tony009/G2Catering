
    //
//  ShowMenuView.m
//  G2Catering
//
//  Created by lcc on 16/6/29.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "ShowMenuView.h"

#define kBtnTag 100

@implementation ShowMenuView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self showView];
    }
    return self;
}

-(void)showView
{
    NSArray *imaArray = @[@"餐台状态_换桌",@"餐台状态_打印按钮",@"餐台状态_结算按钮",@"餐台状态_并桌"];
    for (int i =0; i<imaArray.count; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.tag = kBtnTag+i;
        
        [btn setBackgroundImage:[UIImage imageNamed:imaArray[i]] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnMethod:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btn];
    }
    
}

-(void)setPoint:(CGPoint)point cllFrame:(CGRect)cllFrame
{
    UIImageView *imagev = [[UIImageView alloc] initWithFrame:cllFrame];
    imagev.layer.cornerRadius = 10;
    imagev.layer.masksToBounds = YES;
    imagev.layer.borderColor = [UIColor lightGrayColor].CGColor;
    imagev.layer.borderWidth = 1;
    imagev.backgroundColor = [UIColor whiteColor];
    [self addSubview:imagev];
//    29
    CGPoint middlePoint = CGPointMake(29+cllFrame.origin.x+cllFrame.size.width/2, cllFrame.origin.y+42+cllFrame.size.height/2);
    imagev.center = middlePoint;
    
    UIButton *btn = (UIButton *)[self viewWithTag:kBtnTag];
    UIButton *btn2 = (UIButton *)[self viewWithTag:kBtnTag+1];
    UIButton *btn3 = (UIButton *)[self viewWithTag:kBtnTag+2];
    UIButton *btn4 = (UIButton *)[self viewWithTag:kBtnTag+3];
    CGFloat marginWidth = cllFrame.size.width/3;
    btn.center = middlePoint;
    btn2.center = middlePoint;
    btn3.center = middlePoint;
    btn4.center = middlePoint;
    
    [UIView animateWithDuration:1.0 animations:^{
        btn.frame = CGRectMake(cllFrame.origin.x-20,cllFrame.origin.y+66 , marginWidth, marginWidth);
        btn4.frame = CGRectMake(cllFrame.origin.x+cllFrame.size.width+25,cllFrame.origin.y+66 , marginWidth, marginWidth);
        btn2.frame = CGRectMake(42+cllFrame.origin.x,cllFrame.origin.y -10, marginWidth, marginWidth);
        btn3.frame = CGRectMake(40+cllFrame.origin.x+cllFrame.size.width/2+10,cllFrame.origin.y-10 , marginWidth, marginWidth);
    } completion:^(BOOL finished) {
        
    }];
    
}

- (IBAction)btnMethod:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(btnDelegateMethod:deskName:)]) {
        [self.delegate btnDelegateMethod:sender deskName:self.deskName];
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self btnMethod:nil];
}




@end
