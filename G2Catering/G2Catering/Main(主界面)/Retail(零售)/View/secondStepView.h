//
//  secondStepView.h
//  G2Catering
//
//  Created by iOS  on 16/6/21.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^secondStepViewBlock)(BOOL type);
@interface secondStepView : UIView
@property(nonatomic,copy)secondStepViewBlock block;
@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UIView *allView;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *yesBtn;

@end
