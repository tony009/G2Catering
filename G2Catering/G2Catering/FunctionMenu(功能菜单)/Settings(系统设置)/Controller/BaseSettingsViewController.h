//
//  BaseSettingsViewController.h
//  G2Catering
//
//  Created by NDlan on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseSettingsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIView *rightBackView;
@property (weak, nonatomic) IBOutlet UIView *leftAndContentBackView;

@property (weak, nonatomic) IBOutlet UIButton *right_tittle;
@property (weak, nonatomic) IBOutlet UITextField *right_printName;
@property (weak, nonatomic) IBOutlet UITextField *right_brandName;
@property (weak, nonatomic) IBOutlet UITextField *right_IPAddress;

@property (weak, nonatomic) IBOutlet UIImageView *right_status;
@property (weak, nonatomic) IBOutlet UIImageView *right_test;
@property (weak, nonatomic) IBOutlet UIButton *right_cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *right_sureBtn;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *right_foodTypeBtns;




@end
