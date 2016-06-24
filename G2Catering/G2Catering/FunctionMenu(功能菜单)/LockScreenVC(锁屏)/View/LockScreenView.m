//
//  LockScreenView.m
//  G2Catering
//
//  Created by NDlan on 16/6/24.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "LockScreenView.h"
#import <Masonry.h>
#import "UnLockView.h"
@interface LockScreenView ()

@property (nonatomic, strong) UIView *selfView;

@property (nonatomic, copy) NSString *screenStatus;

@property (nonatomic, strong) UnLockView *unLockView;
@end

@implementation LockScreenView

- (void)awakeFromNib{
    
    self.numBtn.userInteractionEnabled = NO;
    UISwipeGestureRecognizer *pan = [[UISwipeGestureRecognizer alloc] init];
    [pan addTarget:self action:@selector(pullDown:)];
    pan.direction = UISwipeGestureRecognizerDirectionDown;
    [self.cloudImageView addGestureRecognizer:pan];
    self.screenStatus = @"unlock";
    

}

- (void)pullDown:(UIGestureRecognizer *)gestureRecognizer{
    
    if ([self.screenStatus isEqualToString:@"unlock"]) {
        
        self.backViewTopMargin.constant = 0;
        
        [UIView animateWithDuration:1 animations:^{
            
            [self layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            
            self.backViewTopMargin.constant = -30;
            
            [UIView animateWithDuration:1 animations:^{
                
                [self layoutIfNeeded];
                [self.lockOrUnlockImageView setImage:[UIImage imageNamed:@"解锁"]];
                self.screenStatus = @"lock";
            }];
        }];
        
    }else{
        
        self.backViewTopMargin.constant = 0;
        
        [UIView animateWithDuration:1 animations:^{
            
            [self layoutIfNeeded];
            
        } completion:^(BOOL finished) {
            
            
            self.backViewTopMargin.constant = -100;
            
            [UIView animateWithDuration:1 animations:^{
                
                [self layoutIfNeeded];
                [self.lockOrUnlockImageView setImage:[UIImage imageNamed:@"锁屏"]];
                
                self.screenStatus = @"unlock";

        } completion:^(BOOL finished) {
            
                [self removeFromSuperview];
            
                self.unLockView = [[NSBundle mainBundle] loadNibNamed:@"UnLockView" owner:nil options:nil].lastObject;
                CGRect frame = self.unLockView.frame ;
                
                frame = CGRectMake(690, 0, 124, 200);
                self.unLockView.frame = frame;
                
                [KWindow addSubview:self.unLockView];

            }];
        }];
    }
    
    
    
}

@end
