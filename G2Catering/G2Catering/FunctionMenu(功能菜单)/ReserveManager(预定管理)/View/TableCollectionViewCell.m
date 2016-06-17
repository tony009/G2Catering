//
//  TableCollectionViewCell.m
//  G2Catering
//
//  Created by NDlan on 16/6/16.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "TableCollectionViewCell.h"

@implementation TableCollectionViewCell

- (void)awakeFromNib {
    
    self.labelBackView.layer.cornerRadius = 5;
    self.labelBackView.layer.masksToBounds = YES;
    
    self.labelBackView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.labelBackView.layer.borderWidth = 1;
}

@end
