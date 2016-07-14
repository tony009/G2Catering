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
    self.typeSelectBtn.layer.cornerRadius = 35;
    self.typeSelectBtn.layer.masksToBounds = YES;
    self.typeSelectBtn.backgroundColor = [UIColor whiteColor];
    
    self.typeSelectBtn1.layer.masksToBounds = YES;
    self.typeSelectBtn1.layer.cornerRadius = 35;
    self.typeSelectBtn1.backgroundColor = [UIColor whiteColor];
    
    self.typeSelectBtn2.layer.masksToBounds = YES;
    self.typeSelectBtn2.layer.cornerRadius = 35;
    self.typeSelectBtn2.backgroundColor = [UIColor whiteColor];
}

- (IBAction)btnMethod:(UIButton *)sender {
    
    if ([self.delegate respondsToSelector:@selector(btnDelegateName:number:type:)]) {
        [self.delegate btnDelegateName:_goodSuccess number:[self.numberLabel.text intValue] type:1];
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
    }else if (btnSender.tag ==3){
        number = number+1;
        self.numberLabel.text = [NSString stringWithFormat:@"%d",number];
    }
    if (btnSender.tag ==5||btnSender.tag ==6||btnSender.tag ==7) {
        if (btnSender.backgroundColor == [UIColor whiteColor]) {
            [btnSender setBackgroundColor:[UIColor blueColor]];
        }else{
            [btnSender setBackgroundColor:[UIColor whiteColor]];
        }
    }
}



@end
