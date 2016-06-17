//
//  AddBookView.h
//  G2Catering
//
//  Created by NDlan on 16/6/16.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddBookView : UIView
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIButton *hourBtn;
@property (weak, nonatomic) IBOutlet UIButton *dayBtn;
@property (weak, nonatomic) IBOutlet UITextField *keepTimeTextField;
@property (weak, nonatomic) IBOutlet UITextField *depositTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UIButton *chooseTableBtn;
@property (weak, nonatomic) IBOutlet UITextField *peopleNumTextField;

@property (weak, nonatomic) IBOutlet UIButton *bookTime;
@property (weak, nonatomic) IBOutlet UIButton *gentlemenBtn;
@property (weak, nonatomic) IBOutlet UIButton *ladiesBtn;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;

@end
