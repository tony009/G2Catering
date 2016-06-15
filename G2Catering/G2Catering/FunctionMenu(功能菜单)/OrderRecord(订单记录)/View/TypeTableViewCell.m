//
//  TypeTableViewCell.m
//  G2Catering
//
//  Created by iOS  on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "TypeTableViewCell.h"

@implementation TypeTableViewCell

- (void)awakeFromNib {

   [self.titleBtn setTitleColor:[UIColor colorWithRed:143/255.0 green:159/255.0 blue:175/255.0 alpha:1] forState:UIControlStateNormal];
  [self.titleBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.titleBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
     self.titleBtn.backgroundColor = [UIColor clearColor] ;
}


- (void)btnAction:(UIButton *)btn{
    btn.selected = !btn.selected;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
