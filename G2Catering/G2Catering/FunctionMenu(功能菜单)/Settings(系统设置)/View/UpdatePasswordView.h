//
//  UpdatePasswordView.h
//  G2Catering
//
//  Created by NDlan on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdatePasswordView : UIView
@property (weak, nonatomic) IBOutlet UITextField *oldPasswordTextField;

@property (weak, nonatomic) IBOutlet UITextField *newsPasswordTextField;

@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordTextfield;

@property (weak, nonatomic) IBOutlet UIButton *sureBtn;

@end
