//
//  BaseSettingsViewController.m
//  G2Catering
//
//  Created by NDlan on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "BaseSettingsViewController.h"
#import "UpdatePasswordView.h"
#import "AboutSettingsView.h"
#import "DeviceTestView.h"
#import "PrintSettingsView.h"
#import "EstimateView.h"
@interface BaseSettingsViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *leftMeunBtns;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *estimateStatusBtns;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *marginOfEstimateAndUpdate;
@property (weak, nonatomic) IBOutlet UIView *estimateStatusBtnBackView;

@property (nonatomic, strong) UIButton *currentMeunBtn;
@property (nonatomic, strong) UIButton *statusBtn;


@property (weak, nonatomic) IBOutlet UIView *contentBackView;


@end

@implementation BaseSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.estimateStatusBtnBackView.hidden = YES;
    
    self.contentBackView.layer.cornerRadius = 5;
    self.contentBackView.layer.masksToBounds = YES;
    
    for (int i = 0; i<self.leftMeunBtns.count; i++) {
        
        UIButton *btn = self.leftMeunBtns[i];
        btn.tag = 10000 + i;
        [btn addTarget:self action:@selector(didClickLeftMeunBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    for (int i = 0; i<self.estimateStatusBtns.count; i++) {
        
        UIButton *btn = self.estimateStatusBtns[i];
        btn.tag = 1000 + i;
        [btn addTarget:self action:@selector(didClickestimateStatusBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}

- (void)didClickLeftMeunBtn:(UIButton *)sender {

    for (UIView *view in self.contentBackView.subviews) {
        
        [view removeFromSuperview];
    }
    
    if (self.currentMeunBtn.selected) {
        
        self.currentMeunBtn.selected = NO;
    }
    
    sender.selected = !sender.selected;
    
    self.currentMeunBtn = sender;
    
    if (sender.tag == 10001) {
        
        UpdatePasswordView *view = [[NSBundle mainBundle] loadNibNamed:@"UpdatePasswordView" owner:nil options:nil].firstObject;
        
        [self.contentBackView addSubview:view];
    }
    
    if (sender.tag == 10002) {
        
        AboutSettingsView *view = [[NSBundle mainBundle] loadNibNamed:@"AboutSettingsView" owner:nil options:nil].firstObject;
        
        [self.contentBackView addSubview:view];
    }
    
    if (sender.tag == 10003) {
        
        DeviceTestView *view = [[NSBundle mainBundle] loadNibNamed:@"DeviceTestView" owner:nil options:nil].firstObject;
        
        [self.contentBackView addSubview:view];
    }
    
    if (sender.tag == 10004) {
        
        PrintSettingsView *view = [[NSBundle mainBundle] loadNibNamed:@"PrintSettingsView" owner:nil options:nil].firstObject;
        
        [self.contentBackView addSubview:view];
    }
    
    if (sender.tag == 10000) {
        
        EstimateView *view = [[NSBundle mainBundle] loadNibNamed:@"EstimateView" owner:nil options:nil].firstObject;
        
        [self.contentBackView addSubview:view];
    }
    
    if (sender.tag == 10000 && self.estimateStatusBtnBackView.hidden == YES) {
        
        [UIView animateWithDuration:0.3 animations:^{
            self.estimateStatusBtnBackView.hidden = NO;
            self.marginOfEstimateAndUpdate.constant = 200;
        }];

    }else{
        
        
        [UIView animateWithDuration:0.3 animations:^{
            
            self.estimateStatusBtnBackView.hidden = YES;
            self.marginOfEstimateAndUpdate.constant = 70;
        }];

    }
    
}

- (void)didClickestimateStatusBtn:(UIButton *)sender {

    if (self.statusBtn.selected) {
        
        self.statusBtn.selected = NO;
    }
   
    sender.selected = !sender.selected;

    self.statusBtn = sender;

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
