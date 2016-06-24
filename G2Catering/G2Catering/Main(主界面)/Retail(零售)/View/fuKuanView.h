//
//  fuKuanView.h
//  G2Catering
//
//  Created by iOS  on 16/6/20.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class fuKuanView;
@protocol fuKuanViewDelegate <NSObject>

@optional
- (void)fuKuanViewDidChickYes:(fuKuanView  *)orderContent WithYuE:(NSString *)yue ;
@end
@interface fuKuanView : UIView

@property(nonatomic,assign) id<fuKuanViewDelegate>delegate;
@property(nonatomic,copy)NSString *statusString;
@property (weak, nonatomic) IBOutlet UIView *shuakaView;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

@property (weak, nonatomic) IBOutlet UIButton *waitBtn;
@property (weak, nonatomic) IBOutlet UIButton *upLoadBtn;
@property (weak, nonatomic) IBOutlet UIButton *successBtn;
@property (weak, nonatomic) IBOutlet UIButton *printBtn;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIButton *midBtn;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIView *cashView;
@property (weak, nonatomic) IBOutlet UIButton *finishBtn;
@property (weak, nonatomic) IBOutlet UIButton *continueBtn;
@property (weak, nonatomic) IBOutlet UIView *textView;
@property (weak, nonatomic) IBOutlet UITextField *phoneText;

@end
