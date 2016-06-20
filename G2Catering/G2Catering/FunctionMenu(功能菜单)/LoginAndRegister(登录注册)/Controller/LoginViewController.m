//
//  LoginViewController.m
//  G2Catering
//
//  Created by NDlan on 16/6/20.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "LoginViewController.h"
#import "MainViewController.h"
#import "SearchBlueToothView.h"
@interface LoginViewController ()

@property (nonatomic, strong) SearchBlueToothView *searchView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setupUI];

    [self setupSearchBlueToothView];

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
    
    
    MainViewController *mvc = [[MainViewController alloc]init];
    
    UINavigationController *na = [[UINavigationController alloc]initWithRootViewController:mvc];
    na.navigationBarHidden = YES;
    
    [self presentViewController:na animated:YES completion:nil];
    
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
