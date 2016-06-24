//
//  secondStepView.h
//  G2Catering
//
//  Created by iOS  on 16/6/21.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^secondStepViewBlock)(BOOL type,NSString *money);
@interface secondStepView : UIView
@property(nonatomic,copy)secondStepViewBlock block;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIView *allView;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *yesBtn;
@property (weak, nonatomic) IBOutlet UIView *textView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *cardType;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel1;
@property (weak, nonatomic) IBOutlet UILabel *yuLabel;
@property (weak, nonatomic) IBOutlet UILabel *discountLabel;
@property (weak, nonatomic) IBOutlet UILabel *cardType1;
@property (weak, nonatomic) IBOutlet UILabel *scroeLabel;
@property (weak, nonatomic) IBOutlet UITextField *phoneText;

@end
