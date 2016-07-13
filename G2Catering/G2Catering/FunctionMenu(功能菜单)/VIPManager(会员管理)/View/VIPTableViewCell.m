//
//  VIPTableViewCell.m
//  G2Catering
//
//  Created by iOS  on 16/6/15.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "VIPTableViewCell.h"


@interface VIPTableViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@property (weak, nonatomic) IBOutlet UILabel *typeLabel;

@property (weak, nonatomic) IBOutlet UILabel *amountLabel;

@property (weak, nonatomic) IBOutlet UILabel *pointLabel;

@property (weak, nonatomic) IBOutlet UILabel *createTimeLabel;


@property (weak, nonatomic) IBOutlet UILabel *lastUsedTimeLabel;

@end

@implementation VIPTableViewCell

- (void)awakeFromNib {
    [self.switchView setOnImage:[UIImage imageNamed:@"交易记录－堂食"]];
        [self.switchView setOffImage:[UIImage imageNamed:@"交易记录－堂食-点击"]];
    
    
}

-(void)setModel:(UserModel *)model{
    
    
    self.nameLabel.text = model.name;
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
