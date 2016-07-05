//
//  MainLeftTableViewCell.m
//  G2Catering
//
//  Created by wd on 16/6/16.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "MainLeftTableViewCell.h"

@implementation MainLeftTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
    if (selected) {
        self.pImageView.image = [UIImage imageNamed:self.selectedImageName];
        self.pLabel.textColor = [UIColor whiteColor];
        
        
    }else{
        
        self.pImageView.image = [UIImage imageNamed:self.defaultImageName];
        self.pLabel.textColor = [UIColor lightGrayColor];
    }
    
}

@end
