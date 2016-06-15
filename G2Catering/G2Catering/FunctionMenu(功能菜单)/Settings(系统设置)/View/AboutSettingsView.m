//
//  AboutSettingsView.m
//  G2Catering
//
//  Created by NDlan on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "AboutSettingsView.h"

@implementation AboutSettingsView

- (void)awakeFromNib{
    
    self.textView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.textView.layer.borderWidth = 1;
    self.textView.layer.cornerRadius = 1;
    self.textView.layer.masksToBounds = YES;
    
    self.sendBtn.layer.cornerRadius = 5;
    self.sendBtn.layer.masksToBounds = YES;
    [self.sendBtn addTarget:self action:@selector(didClickSendSuggestBtn) forControlEvents:UIControlEventTouchUpInside];
}


- (void)didClickSendSuggestBtn{
    
    NSLog(@"%s",__func__ );
}

@end
