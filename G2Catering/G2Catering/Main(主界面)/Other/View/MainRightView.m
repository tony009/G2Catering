//
//  MainRightView.m
//  G2Catering
//
//  Created by wd on 16/6/13.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "MainRightView.h"
#import  "LingShouViewController.h"


@interface MainRightView ()

@property (nonatomic,strong) UIButton *lastSelectedButton;

@end


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

-(void)setButtonBackgroundColor:(UIButton *)button{
    
    if (self.lastSelectedButton) {
        [self.lastSelectedButton setBackgroundColor:RGB(0x2a, 0x42, 0x5a)];
    }
    
    [button setBackgroundColor:RGB(0x17, 0x2e, 0x45)];
    
    self.lastSelectedButton = button;
    
}

- (IBAction)orderingAction:(UIButton *)sender {
    
    

    [self setButtonBackgroundColor:sender];
    
    
    if([self.delegate respondsToSelector:@selector(MainRightViewMenuDidChick:withIndex:)]){
        
        [self.delegate MainRightViewMenuDidChick:self withIndex:0];
    }
    
}

- (IBAction)dinnerTableAction:(UIButton *)sender {
    
    [self setButtonBackgroundColor:sender];
    
    if([self.delegate respondsToSelector:@selector(MainRightViewMenuDidChick:withIndex:)]){
        
        [self.delegate MainRightViewMenuDidChick:self withIndex:1];
    }
    
}

- (IBAction)lingShouAction:(id)sender {
    
    [self setButtonBackgroundColor:sender];
    
    if([self.delegate respondsToSelector:@selector(MainRightViewMenuDidChick:withIndex:)]){
        
        [self.delegate MainRightViewMenuDidChick:self withIndex:2];
    }
    
}





@end
