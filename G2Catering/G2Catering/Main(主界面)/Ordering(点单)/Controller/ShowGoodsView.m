//
//  ShowGoodsView.m
//  G2Catering
//
//  Created by lcc on 16/7/13.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "ShowGoodsView.h"

@implementation ShowGoodsView

-(void)awakeFromNib
{
    self.typeSelectBtn.layer.cornerRadius = 10;
    self.typeSelectBtn.layer.masksToBounds = YES;
    
    self.typeSelectBtn1.layer.cornerRadius = 10;
    self.typeSelectBtn1.layer.masksToBounds = YES;
    
    self.typeSelectBtn2.layer.cornerRadius = 10;
    self.typeSelectBtn2.layer.masksToBounds = YES;
}

- (IBAction)btnMethod:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(btnDelegateName:number:type:)]) {
        [self.delegate btnDelegateName:nil number:1 type:1];
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self btnMethod:nil];
}

-(IBAction)selectBtnMethod:(UIButton *)btnSender
{
    int number = [self.numberLabel.text intValue];
    if (btnSender.tag == 4) {
        if (number==1) {
            return;
        }else{
           self.numberLabel.text = [NSString stringWithFormat:@"%d",number-1];
        }
    }else{
        number = number+1;
        self.numberLabel.text = [NSString stringWithFormat:@"%d",number];
    }
}
@end
