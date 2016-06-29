//
//  DeskCollectionViewCell.m
//  G2Catering
//
//  Created by tencrwin on 16/6/17.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "DeskCollectionViewCell.h"

@implementation DeskCollectionViewCell

- (void)awakeFromNib {
    self.imgView.layer.cornerRadius = 10;
    self.imgView.layer.masksToBounds = YES;
    self.imgView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.imgView.layer.borderWidth = 1;
   
}

@end
