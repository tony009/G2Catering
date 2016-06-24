//
//  UnLockView.m
//  G2Catering
//
//  Created by NDlan on 16/6/24.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "UnLockView.h"
#import "LockScreenView.h"
@interface UnLockView ()

@property (nonatomic, strong) LockScreenView *lockScreenView;

@property (nonatomic, copy) NSString *screenStatus;
@end

@implementation UnLockView


- (void)awakeFromNib{
    
    self.numBtn.userInteractionEnabled = NO;
    UISwipeGestureRecognizer *pan = [[UISwipeGestureRecognizer alloc] init];
    [pan addTarget:self action:@selector(unLockpullDown)];
    pan.direction = UISwipeGestureRecognizerDirectionDown;
    [self.cloudImageView addGestureRecognizer:pan];
    self.screenStatus = @"unlock";
    
    self.lockScreenView = [[NSBundle mainBundle] loadNibNamed:@"LockScreenView" owner:nil options:nil].firstObject;
}

- (void)unLockpullDown{
    
    [self removeFromSuperview];
    
    [KWindow addSubview: self.lockScreenView];
    
    [self.lockScreenView pullDown:nil];
    
}

@end
