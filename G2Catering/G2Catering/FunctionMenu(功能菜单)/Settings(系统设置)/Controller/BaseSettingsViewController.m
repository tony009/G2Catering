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
    self.rightBackView.hidden = YES;
    
    self.contentBackView.layer.cornerRadius = 5;
    self.contentBackView.layer.masksToBounds = YES;
    

    [self setupLeftView];
    
    [self setupRightView];
}

#pragma mark - setupLeftView

- (void)setupLeftView{
    
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
    
    [self didClickLeftMeunBtn:self.leftMeunBtns[0]];
}


- (void)didClickLeftMeunBtn:(UIButton *)sender {
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.leftAndContentBackView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        self.rightBackView.hidden = YES;
    }];

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
        
        [view.addBtn addTarget:self action:@selector(addPrintDevice) forControlEvents:UIControlEventTouchUpInside];
        
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

- (void)addPrintDevice{
    
    
    [UIView animateWithDuration:0.3 animations:^{
        
       self.leftAndContentBackView.transform = CGAffineTransformMakeTranslation(-356, 0);
        
    } completion:^(BOOL finished) {
        
        self.rightBackView.hidden = NO;
    }];
}

#pragma mark- setupRightView

- (void)setupRightView{
    
    self.rightBackView.layer.cornerRadius = 5;
    self.rightBackView.layer.masksToBounds = YES;
    
    self.right_tittle.layer.cornerRadius = 2;
    self.right_tittle.layer.masksToBounds = YES;
    
    self.right_sureBtn.layer.cornerRadius = 2;
    self.right_sureBtn.layer.masksToBounds = YES;
    [self.right_sureBtn addTarget:self action:@selector(didClickRightSureBtn) forControlEvents:UIControlEventTouchUpInside];
    self.right_cancelBtn.layer.cornerRadius = 2;
    self.right_cancelBtn.layer.masksToBounds = YES;
    [self.right_cancelBtn addTarget:self action:@selector(didClickRightCancelBtn) forControlEvents:UIControlEventTouchUpInside];
    
    for (int i = 0; i<self.right_foodTypeBtns.count; i++) {
        
        UIButton *btn = self.right_foodTypeBtns[i];
        btn.tag = 200 + i;
        [btn addTarget:self action:@selector(chooseRightViewFoodType:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    
    UITapGestureRecognizer *tapStatus = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickRight_status)];
    
    [self.right_status addGestureRecognizer:tapStatus];
    
    
    UITapGestureRecognizer *tapTest = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didClickRight_test)];
    
    [self.right_test addGestureRecognizer:tapTest];
}

- (void)didClickRight_status{
    
    NSLog(@"%s",__func__);
}

- (void)didClickRight_test{
    
    NSLog(@"%s",__func__);
}

- (void)chooseRightViewFoodType:(UIButton *)sender{
    
    sender.selected = YES;
}

- (void)didClickRightSureBtn{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.leftAndContentBackView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        self.rightBackView.hidden = YES;
    }];
    
}


- (void)didClickRightCancelBtn{
    
    [UIView animateWithDuration:0.3 animations:^{
        
        self.leftAndContentBackView.transform = CGAffineTransformIdentity;
        
    } completion:^(BOOL finished) {
        
        self.rightBackView.hidden = YES;
    }];
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
