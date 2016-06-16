//
//  EstimateSettingView.h
//  G2Catering
//
//  Created by NDlan on 16/6/15.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EstimateSettingView : UIView
@property (weak, nonatomic) IBOutlet UIButton *closeBtn;
@property (weak, nonatomic) IBOutlet UILabel *foodName;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *keybordNumberBtn;

@property (weak, nonatomic) IBOutlet UIButton *pointBtn;
@property (weak, nonatomic) IBOutlet UIButton *deleteBtn;
@property (weak, nonatomic) IBOutlet UIButton *sureBtn;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIView *estimateSettingView;

@property (weak, nonatomic) IBOutlet UITextField *numTextField;
@end
