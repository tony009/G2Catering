//
//  LoginViewController.m
//  G2Catering
//
//  Created by NDlan on 16/6/20.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "HttpTool.h"
#import "LoginViewController.h"
#import "MainViewController.h"
#import "SearchBlueToothView.h"
#import "LockScreenView.h"
#import "UnLockView.h"
#import "BluetoothConnectionViewController.h"
#import "UserDataManager.h"
@interface LoginViewController ()<UITextFieldDelegate>

@property (nonatomic, strong) SearchBlueToothView *searchView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupUI];
    
    [self setupSearchBlueToothView];
    
    
    //[KWindow bringSubviewToFront:unLockView];
    
    LoginModel *model = [[LoginModel alloc]initWithLoginUsername:@"admin" loginPassword:@"admin1"];
    
    [UserDataManager logIn:model success:^(id response) {
        
    } failure:^(NSError *error) {
        
    }];
    
    
}

#pragma mark- setupSearchBlueToothView
- (void)setupSearchBlueToothView{
    
    self.searchView = [[NSBundle mainBundle] loadNibNamed:@"SearchBlueToothView" owner:nil options:nil].firstObject;
    
    self.searchView.hidden = YES;
    
    [self.view addSubview:self.searchView];
    
    [self.searchView.closeBtn addTarget:self action:@selector(didClickCloseBtn) forControlEvents:UIControlEventTouchUpInside];
    
    [self.searchView.scanBtn addTarget:self action:@selector(didClickScanBtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didClickCloseBtn{
    
    self.searchView.hidden = YES;
    
}

- (void)didClickScanBtn{
    
    NSLog(@"点击扫描");
    
}




#pragma mark- setupUI

- (void)setupUI{
    
    self.accountTextField.delegate = self;
    self.passwordTextField.delegate = self;
    
    self.loginBtn.layer.cornerRadius  = 5;
    self.loginBtn.layer.masksToBounds = YES;
    
    self.promptView.layer.cornerRadius  = 5;
    self.promptView.layer.masksToBounds = YES;
    self.promptView.hidden = YES;
    
    [self.loginBtn addTarget:self action:@selector(didClickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.remenberBtn addTarget:self action:@selector(didClickRemenberBtn:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)didClickRemenberBtn:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
}

- (void)didClickLoginBtn {
    
    if (self.remenberBtn.selected ) {
        
        NSLog(@"没记住");
    }
    
//    "loginUsername":"admin","loginPassword":"admin"
//    NSDictionary *loginDic = @{@"loginUsername":@"admin",@"loginPassword":@"admin1"};
    
//    [HttpTool postWithForm:@"g2-service-module/business/bm/users/appLogin" parameters:loginDic modelClass:@"" keyPath:@"" success:^(id response) {
//        
//
//
//    } failure:^(NSError *error) {
//        
//    }];
    
//    BluetoothConnectionViewController *bcVC = [[BluetoothConnectionViewController alloc]init];
//    UINavigationController *nc = [[UINavigationController alloc]initWithRootViewController:bcVC];
//    nc.modalPresentationStyle = UIModalPresentationFormSheet;
//    [KWindow.rootViewController presentViewController:nc animated:YES completion:^{
//       
//    }];
//    
//    return;
    
    MainViewController *mvc = [[MainViewController alloc]init];
    
    UINavigationController *na = [[UINavigationController alloc]initWithRootViewController:mvc];
    
    na.navigationBarHidden = YES;
    
    [self presentViewController:na animated:YES completion:nil];
    
    
    UnLockView *unLockView = [[NSBundle mainBundle] loadNibNamed:@"UnLockView" owner:nil options:nil].lastObject;
    
    CGRect frame = unLockView.frame ;
    
    frame = CGRectMake(710, 0, 124, 200);
    unLockView.frame = frame;
  
    [KWindow addSubview:unLockView];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.accountTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
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
