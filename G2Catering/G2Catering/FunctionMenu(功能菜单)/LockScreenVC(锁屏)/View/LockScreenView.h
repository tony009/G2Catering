//
//  LockScreenView.h
//  G2Catering
//
//  Created by NDlan on 16/6/24.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LockScreenView : UIView
@property (weak, nonatomic) IBOutlet UIView *lockBackView;
@property (weak, nonatomic) IBOutlet UIImageView *cloudImageView;
@property (weak, nonatomic) IBOutlet UIButton *numBtn;
@property (weak, nonatomic) IBOutlet UIImageView *lockOrUnlockImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *backViewTopMargin;


- (void)pullDown:(UIGestureRecognizer *)gestureRecognizer;
@end
