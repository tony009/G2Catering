//
//  MainViewController.m
//  G2Catering
//
//  Created by wd on 16/6/12.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "MainViewController.h"
#import "MainLeftView.h"
@interface MainViewController ()
@property (nonatomic,strong) UIView *leftView;
@property (nonatomic,strong) UIView *rightView;
@property (nonatomic) int flag;   //(-1,左,0正常，1右)
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.flag = 0;
    
    
    [self p_initViews];
    
}

- (IBAction)OrderAction:(UIButton *)sender {
    
    
}


- (IBAction)dinnerTableAction:(UIButton *)sender {
    
    
    
}

- (IBAction)buttonAction:(id)sender {
    
    
    
    
}


-(void)p_initViews{
    
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(p_swipeLeft)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;

    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(p_swipeRight)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:swipeLeft];
    [self.view addGestureRecognizer:swipeRight];
    
    
    MainLeftView *leftView =  [[[NSBundle mainBundle]loadNibNamed:@"MainLeftView" owner:self options:nil]lastObject];
    
    leftView.frame = CGRectMake(0, 0, 300, KScreenHeight);
    

    MainLeftView *rightView =  [[[NSBundle mainBundle]loadNibNamed:@"MainRightView" owner:self options:nil]lastObject];
    
    rightView.frame = CGRectMake(KScreenWidth-300, 0, 300, KScreenHeight);
    
    self.leftView = leftView;
    self.rightView = rightView;
    
    
    self.leftView.hidden = YES;
    self.rightView.hidden = YES;
    
    [KWindow addSubview:leftView];
    [KWindow addSubview:rightView];
    
}

-(void)viewWillLayoutSubviews{
    
    self.leftView.frame  = CGRectMake(0, 0, 300, KScreenHeight);
    self.rightView.frame = CGRectMake(KScreenWidth-300, 0, 300, KScreenHeight);
}

-(void)viewDidLayoutSubviews{
    
    
    
}

-(void)p_swipeLeft{
    
    
    if (self.flag == 0) { //正常
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self.view.transform = CGAffineTransformMakeTranslation(-300, 0);
            
        } completion:^(BOOL finished) {
            
            self.flag = 1;
            self.rightView.hidden = NO;
            
        }];
        
    }else if (self.flag ==-1){ //右边
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self.view.transform=CGAffineTransformIdentity;
            
        }completion:^(BOOL finished) {
            
            self.flag = 0;
            self.leftView.hidden = YES;
            
        }];
        
    }
    

}


-(void)p_swipeRight{
    
    
    if(self.flag == 0){
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self.view.transform = CGAffineTransformMakeTranslation(300, 0);
            
        } completion:^(BOOL finished) {
            
            self.flag = -1;
            self.leftView.hidden = NO;
            
        }];
        
    }else if (self.flag == 1) {
        
        [UIView animateWithDuration:0.5 animations:^{
            
            self.view.transform=CGAffineTransformIdentity;
            
        }completion:^(BOOL finished) {
            
            self.flag = 0;
            self.rightView.hidden = YES;
            
        }];
    }
    
    

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
