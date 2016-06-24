//
//  fuKuanView.m
//  G2Catering
//
//  Created by iOS  on 16/6/20.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "fuKuanView.h"
#import "secondStepView.h"
@implementation fuKuanView
-(void)awakeFromNib{
    
    [self setRoundAngleWithView:self.bgView withCornerRadius:5 withColor:[UIColor colorWithRed:42/255.0 green:66/255.0 blue:90/255.0 alpha:1]];
    
    [self setRoundAngleWithView:self.textView withCornerRadius:5 withColor:[UIColor colorWithRed:42/255.0 green:66/255.0 blue:90/255.0 alpha:1]];
    
}
//设置圆角
- (void)setRoundAngleWithView:(UIView *)changeView withCornerRadius:(double)cornerRadius withColor:(UIColor *)color{
    
    changeView.layer.masksToBounds = YES;
    changeView.layer.cornerRadius = cornerRadius;
    changeView.layer.borderColor = color.CGColor;
    changeView.layer.borderWidth = 1;
    
}
- (IBAction)yesAction:(id)sender {
    if ([self.statusString isEqualToString:@"vip"]) {
        
        //校验
        secondStepView *stepView = [[[NSBundle mainBundle]loadNibNamed:@"secondStepView" owner: nil options:nil]lastObject];
        stepView.phoneText.text = _phoneText.text;
        __block secondStepView *this = stepView;
        stepView.block = ^(BOOL type,NSString *money){
            
            if (type) {
            
              if ([ self.delegate respondsToSelector:@selector(fuKuanViewDidChickYes:WithYuE:)]) {
            
                        [self.delegate fuKuanViewDidChickYes:self WithYuE:money];
                    }
            

                [this removeFromSuperview];
                [self removeFromSuperview];
            }else{
                
                [this removeFromSuperview];
                self.statusString = @"vip";
            }
            
        };
        self.shuakaView.hidden = YES;
        [self.bgView addSubview:stepView];
        self.bgView.hidden = NO;
        self.textView.hidden = YES;
    }
    
    
}


- (IBAction)cancelAction:(id)sender {
    [self removeFromSuperview];
}

- (IBAction)midAction:(UIButton *)sender {
    
    
}



- (IBAction)phoneAction:(id)sender {
    secondStepView *stepView = [[[NSBundle mainBundle]loadNibNamed:@"secondStepView" owner:nil options:nil]lastObject];
    __block secondStepView *this = stepView;
    stepView.block = ^(BOOL type,NSString *money){
      
        if (type) {
            [this removeFromSuperview];
            self.statusString = @"1";
        }else{
            
            [this removeFromSuperview];
             self.statusString = @"0";
        }
        
    };
     self.shuakaView.hidden = YES;
    [self.bgView addSubview:stepView];
    
}


- (IBAction)cardAction:(id)sender {
    secondStepView *stepView = [[[NSBundle mainBundle]loadNibNamed:@"secondStepView" owner:nil options:nil]lastObject];
     self.shuakaView.hidden = YES;
    [self.bgView addSubview:stepView];
}


-(void)setStatusString:(NSString *)statusString{
    _statusString = statusString;
    
 if ([self.statusString isEqualToString:@"card"]){
        
         self.midBtn.hidden = YES;
        self.cashView.hidden = YES;
        self.shuakaView.hidden = NO;
        self.titleLabel.text = @"请提示顾客付款";
     self.bgView.hidden = NO;
     self.textView.hidden = YES;
     
        
   }else if ([self.statusString isEqualToString:@"vip"]){
     
     
       self.bgView.hidden = YES;
       self.textView.hidden = NO;
     
 }else if ([self.statusString isEqualToString:@"0"]){
        
         self.bgView.hidden = NO;
         self.textView.hidden = YES;
        self.titleLabel.text = @"请提示顾客付款";
        self.shuakaView.hidden = NO;
        self.midBtn.hidden = YES;
   
        
    } else if ([self.statusString isEqualToString:@"1"]){
        self.bgView.hidden = NO;
        self.textView.hidden = YES;
        self.upLoadBtn.selected = YES;
        self.titleLabel.text = @"交易上传中";
        self.shuakaView.hidden = YES;
        self.midBtn.hidden = NO;
        [self.midBtn setImage:[UIImage imageNamed:@"交易上传中"] forState:UIControlStateNormal];
     
        
    } else if ([self.statusString isEqualToString:@"2"]){
        self.bgView.hidden = NO;
        self.textView.hidden = YES;
        self.upLoadBtn.selected = YES;
        self.successBtn.selected = YES;
        self.titleLabel.text = @"交易成功";
        self.shuakaView.hidden = YES;
        self.midBtn.hidden = NO;
        [self.midBtn setImage:[UIImage imageNamed:@"支付成功"] forState:UIControlStateNormal];


       
        
    }else if ([self.statusString isEqualToString:@"3"]){
        self.upLoadBtn.selected = YES;
        self.successBtn.selected = YES;
        self.printBtn.selected = YES;
        self.titleLabel.text = @"正在打印签购单…";
        self.shuakaView.hidden = YES;
        self.midBtn.hidden = NO;
        self.bgView.hidden = NO;
        self.textView.hidden = YES;
        [self.midBtn setImage:[UIImage imageNamed:@"打印签购单"] forState:UIControlStateNormal];

      
        
    }else if([self.statusString isEqualToString:@"other"]){
        self.bgView.hidden = NO;
        self.textView.hidden = YES;
        self.midBtn.hidden = YES;
        self.cashView.hidden = NO;
        self.shuakaView.hidden = YES;
        self.titleLabel.text = [NSString stringWithFormat:@"找零：%@",statusString];
        
        
    }

    
}

- (void)typeChanged:(UIButton *)timer{
   

//    if ([dic[@"type"] isEqualToString:@"1"]) {
//         self.statusString = @"2";
//    }else{
//        self.statusString = @"3";
//    }
//
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
