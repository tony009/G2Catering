//
//  EstimateSettingView.m
//  G2Catering
//
//  Created by NDlan on 16/6/15.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "EstimateSettingView.h"

@implementation EstimateSettingView

- (void)awakeFromNib{
    
    self.estimateSettingView.layer.cornerRadius  = 5;
    self.estimateSettingView.layer.masksToBounds = YES;
    self.numTextField.inputView = [UIView new];
    self.numTextField.inputAccessoryView = [UIView new];
}

@end
