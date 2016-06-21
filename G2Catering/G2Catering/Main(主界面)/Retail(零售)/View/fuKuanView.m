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
    
}
//设置圆角
- (void)setRoundAngleWithView:(UIView *)changeView withCornerRadius:(double)cornerRadius withColor:(UIColor *)color{
    
    changeView.layer.masksToBounds = YES;
    changeView.layer.cornerRadius = cornerRadius;
    changeView.layer.borderColor = color.CGColor;
    changeView.layer.borderWidth = 1;
    
}
- (IBAction)yesAction:(id)sender {
}


- (IBAction)cancelAction:(id)sender {
    [self removeFromSuperview];
}

- (IBAction)phoneAction:(id)sender {
    secondStepView *stepView = [[[NSBundle mainBundle]loadNibNamed:@"secondStepView" owner:nil options:nil]lastObject];
    __block secondStepView *this = stepView;
    stepView.block = ^(BOOL type){
      
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
        
         self.midImg.hidden = YES;
        self.cashView.hidden = YES;
        self.shuakaView.hidden = NO;
        self.titleLabel.text = @"请提示顾客付款";
        
        
    }else if ([self.statusString isEqualToString:@"0"]){
        
        
        self.titleLabel.text = @"请提示顾客付款";
        self.shuakaView.hidden = NO;
        self.midImg.hidden = YES;
   
        
    } else if ([self.statusString isEqualToString:@"1"]){
        
        self.upLoadBtn.selected = YES;
        self.titleLabel.text = @"交易上传中";
        self.shuakaView.hidden = YES;
        self.midImg.hidden = NO;
        [self.midImg setImage:[UIImage imageNamed:@"交易上传中"]];
        NSDictionary *dic =@{@"type":@"1"};
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:5*60 target:self selector:@selector(typeChanged:) userInfo:dic repeats:YES];
        [timer fire];
        
    } else if ([self.statusString isEqualToString:@"2"]){
        
        self.upLoadBtn.selected = YES;
        self.successBtn.selected = YES;
        self.titleLabel.text = @"交易成功";
        self.shuakaView.hidden = YES;
        self.midImg.hidden = NO;
        [self.midImg setImage:[UIImage imageNamed:@"支付成功"]];
        NSDictionary *dic =@{@"type":@"2"};
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:5*60 target:self selector:@selector(typeChanged:) userInfo:dic repeats:YES];
        [timer fire];
        
    }else if ([self.statusString isEqualToString:@"3"]){
        self.upLoadBtn.selected = YES;
        self.successBtn.selected = YES;
        self.printBtn.selected = YES;
        self.titleLabel.text = @"正在打印签购单…";
        self.shuakaView.hidden = YES;
        self.midImg.hidden = NO;
        [self.midImg setImage:[UIImage imageNamed:@"打印签购单"]];
      
        
    }else{
        
        self.midImg.hidden = YES;
        self.cashView.hidden = NO;
        self.shuakaView.hidden = YES;
        self.titleLabel.text = [NSString stringWithFormat:@"找零：%@",statusString];
        
        
    }

    
}

- (void)typeChanged:(NSTimer *)timer{
   
    NSDictionary *dic = timer.userInfo;
    if ([dic[@"type"] isEqualToString:@"1"]) {
         self.statusString = @"2";
    }else{
        self.statusString = @"3";
    }
    [timer invalidate];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
