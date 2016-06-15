//
//  VIPTableViewCell.m
//  G2Catering
//
//  Created by iOS  on 16/6/15.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "VIPTableViewCell.h"

@implementation VIPTableViewCell

- (void)awakeFromNib {
    [self.switchView setOnImage:[UIImage imageNamed:@"交易记录－堂食"]];
        [self.switchView setOffImage:[UIImage imageNamed:@"交易记录－堂食-点击"]];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
