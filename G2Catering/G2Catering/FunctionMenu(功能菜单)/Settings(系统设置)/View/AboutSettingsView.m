//
//  AboutSettingsView.m
//  G2Catering
//
//  Created by NDlan on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "AboutSettingsView.h"

@interface AboutSettingsView ()<UITextViewDelegate>

@end

@implementation AboutSettingsView

- (void)awakeFromNib{//765 655
    
    self.textView  = [[UITextView alloc] initWithFrame:CGRectMake(207, 344, 480, 224)];
    
    self.textView.delegate = self;
    [self addSubview:self.textView];
    
//
//    self.textView.translatesAutoresizingMaskIntoConstraints = NO;
//    
//    NSArray *conH = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-207-[textView]-80-|" options:0 metrics:nil views:@{@"textView":self.textView}];
//    
//    NSArray *conV = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-284-[textView]-147-|" options:0 metrics:nil views:@{@"textView":self.textView}];
//    
//    [self.textView addConstraints:conH];
//    [self.textView addConstraints:conV];
    
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
