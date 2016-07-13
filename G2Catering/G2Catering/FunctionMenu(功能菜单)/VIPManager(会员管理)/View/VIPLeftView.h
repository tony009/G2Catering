//
//  VIPLeftView.h
//  G2Catering
//
//  Created by iOS  on 16/6/15.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>
@class VIPLeftView;
@protocol VIPLeftViewDelegate <NSObject>

@optional
- (void)VIPLeftViewDidChickCancel:(VIPLeftView  *)orderContent;
- (void)VIPLeftViewDidChickYes:(VIPLeftView  *)orderContent;

@end
@interface VIPLeftView : UIView
@property (weak, nonatomic) IBOutlet UILabel *nameLabel; //姓
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField; //电话

@property (weak, nonatomic) IBOutlet UITextField *amountTextField; //金额

@property (weak, nonatomic) IBOutlet UIButton *selectTypeBtn;
@property (weak, nonatomic) IBOutlet UITableView *typeTable;
@property (weak, nonatomic) IBOutlet UIButton *cancelBtn;
@property (weak, nonatomic) IBOutlet UIButton *yesBtn;
@property(nonatomic,weak)id  <VIPLeftViewDelegate> delegate;

@property (strong, nonatomic)  UISegmentedControl *segmentedCtrl;
@property (weak, nonatomic) IBOutlet UIView *topView;


@end
