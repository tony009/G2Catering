//
//  DeviceTestView.m
//  G2Catering
//
//  Created by NDlan on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "DeviceTestView.h"

@implementation DeviceTestView

- (void)awakeFromNib{
    
    self.codeBackView.layer.cornerRadius  = 10;
    self.codeBackView.layer.masksToBounds = YES;
    self.moneyBoxView.layer.cornerRadius  = 10;
    self.moneyBoxView.layer.masksToBounds = YES;
}
- (IBAction)didClickCodePicture:(id)sender {
    
     NSLog(@"%s",__func__ );
}
- (IBAction)didClickMoneyBox:(id)sender {
 
     NSLog(@"%s",__func__ );
}

@end
