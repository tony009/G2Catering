//
//  ZhifuView.h
//  G2Catering
//
//  Created by iOS  on 16/6/17.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZhifuView : UIView

@property (weak, nonatomic) IBOutlet UICollectionView *typeCollection;
@property (weak, nonatomic) IBOutlet UIView *moneyView;
@property (weak, nonatomic) IBOutlet UIButton *scanBtn;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *yesBtn;
@property (weak, nonatomic) IBOutlet UIView *verifyView;
@property (weak, nonatomic) IBOutlet UIButton *button1;


@property (weak, nonatomic) IBOutlet UIButton *button2;

@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIButton *button4;

@property(nonatomic,assign)float price;
@property (weak, nonatomic) IBOutlet UIView *yuFuView;
@property (weak, nonatomic) IBOutlet UILabel *yuMoney;
@property(nonatomic,assign)BOOL isYu;
@property (weak, nonatomic) IBOutlet UIView *allView;

@property (weak, nonatomic) IBOutlet UIView *yuView;


@end
