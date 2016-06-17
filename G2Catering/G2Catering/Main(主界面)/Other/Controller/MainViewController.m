//
//  MainViewController.m
//  G2Catering
//
//  Created by wd on 16/6/12.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "MainViewController.h"
#import "MainLeftView.h"
#import "TradeViewController.h"
#import "DinnerTableViewController.h"
#import "OrderingViewController.h"
#import "VipViewController.h"
#import "BaseSettingsViewController.h"
#import "MainRightView.h"
#import "LingShouViewController.h"
#import "BookingManagerViewController.h"
@interface MainViewController ()<MainLeftViewDelegate,MainRightViewDelegate>
@property (nonatomic,strong) UIView *leftView;
@property (nonatomic,strong) UIView *rightView;
@property (nonatomic) int flag;   //(-1,左,0正常，1右)

@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.flag = 0;
    
    
    [self p_initViews];
    

//    self.button.backgroundColor = [UIColor blackColor];
//    
//    [self.button setTitleEdgeInsets:UIEdgeInsetsMake(40, 40, 40,40 )];
//    
//    self.button.titleLabel.numberOfLines = 0;
    
    
    
    [self OrderAction:nil];

}


-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    
//    UIView *blackView = [[UIView alloc]initWithFrame:CGRectMake(200, 300, 200, 400)];
//    blackView.backgroundColor = [UIColor blackColor];
//    
////    NSDictionary *views = @{
////                            @"view":blackView
////                            };
//    
//    blackView.translatesAutoresizingMaskIntoConstraints = NO;
//    
//    
//    id tView = [NSLayoutConstraint constraintWithItem:blackView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
//    
//    id bView = [NSLayoutConstraint constraintWithItem:blackView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.bottomLayoutGuide attribute:NSLayoutAttributeTop multiplier:1 constant:0];
//    
//    id lView = [NSLayoutConstraint constraintWithItem:blackView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view.layoutMarginsGuide attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
//    
//    id rView = [NSLayoutConstraint constraintWithItem:blackView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view .layoutMarginsGuide attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
//    
//    [self.view addSubview:blackView];
//    
//    
//    [NSLayoutConstraint activateConstraints:@[tView,bView,lView,rView]];
    
}

//点菜功能
- (IBAction)OrderAction:(UIButton *)sender {
    
    OrderingViewController *oVC = [[OrderingViewController alloc]init];
    
    
    [self switchViewController:oVC];
    
    
}

//餐台功能
- (IBAction)dinnerTableAction:(UIButton *)sender {
    
    DinnerTableViewController *dtVC = [[DinnerTableViewController alloc]init];
    

    [self switchViewController:dtVC];
    
}


-(void)switchViewController:(UIViewController *)vc{
    
    for (UIView *view in self.view.subviews) {
        
        [view removeFromSuperview];
        
    }
    
    UIView *view = vc.view;
    
    view.translatesAutoresizingMaskIntoConstraints = NO;
    
    
//        NSDictionary *views = @{
//                                @"view":view
//                                };
//    
//    
//        [self.view addSubview:view];
//    
//    
//        NSArray *hConstrains  = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[view]-|" options:0 metrics:nil views:views];
//        NSArray *vConstrains = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-[view]-|" options:0 metrics:nil views:views];
//    
//    
//    
//        [NSLayoutConstraint activateConstraints:hConstrains];
//        [NSLayoutConstraint activateConstraints:vConstrains];
    
    
   id tView = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:0];
    
    id bView = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1 constant:0];
    
    id lView = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1 constant:0];
    
    id rView = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1 constant:0];
    
    
    [self addChildViewController:vc];
    
    [self.view addSubview:view];
    
    
    [NSLayoutConstraint activateConstraints:@[tView,bView,lView,rView]];
    


    
}



-(void)p_initViews{
    
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(p_swipeLeft)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;

    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(p_swipeRight)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    
    [self.view addGestureRecognizer:swipeLeft];
    [self.view addGestureRecognizer:swipeRight];
    
    
    MainLeftView *leftView =  [[[NSBundle mainBundle]loadNibNamed:@"MainLeftView" owner:self options:nil]lastObject];
    leftView.delegate = self;
    leftView.frame = CGRectMake(-kLeftViewWidth, 0, kLeftViewWidth, KScreenHeight);
    

    MainLeftView *rightView =  [[[NSBundle mainBundle]loadNibNamed:@"MainRightView" owner:self options:nil]lastObject];
    rightView.delegate = self;
    rightView.frame = CGRectMake(KScreenWidth, 0, kLeftViewWidth, KScreenHeight);
    
    self.leftView = leftView;
    self.rightView = rightView;
    
//    
//    self.leftView.hidden = YES;
//    self.rightView.hidden = YES;
    
    [KWindow addSubview:leftView];
    [KWindow addSubview:rightView];
    
}

-(void)viewWillLayoutSubviews{
    
    self.leftView.frame  = CGRectMake(-kLeftViewWidth, 0, kLeftViewWidth, KScreenHeight);
    self.rightView.frame = CGRectMake(KScreenWidth, 0, kLeftViewWidth, KScreenHeight);
}


static float  kDuration = 0.25; //动画持续时间


-(void)p_swipeLeft{
    
    
    if (self.flag == 0) { //正常
        
        [UIView animateWithDuration:kDuration animations:^{
            
            self.view.transform = CGAffineTransformMakeTranslation(-kLeftViewWidth, 0);
            self.rightView.transform = CGAffineTransformMakeTranslation(-kLeftViewWidth, 0);
            
        } completion:^(BOOL finished) {
            
            self.flag = 1;
            //self.rightView.hidden = NO;
            
        }];
        
    }else if (self.flag ==-1){ //右边
        
        [UIView animateWithDuration:kDuration animations:^{
            
            self.view.transform=CGAffineTransformIdentity;
            self.leftView.transform = CGAffineTransformIdentity;
            
        }completion:^(BOOL finished) {
            
            self.flag = 0;
            //self.leftView.hidden = YES;
            
        }];
        
    }
    

}


-(void)p_swipeRight{
    
    
    if(self.flag == 0){
        
        [UIView animateWithDuration:kDuration animations:^{
            
            self.view.transform = CGAffineTransformMakeTranslation(kLeftViewWidth, 0);
            self.leftView.transform = CGAffineTransformMakeTranslation(kLeftViewWidth, 0);
            
        } completion:^(BOOL finished) {
            
            self.flag = -1;
            //self.leftView.hidden = NO;
            
        }];
        
    }else if (self.flag == 1) {
        
        [UIView animateWithDuration:kDuration animations:^{
            
            self.view.transform=CGAffineTransformIdentity;
            self.rightView.transform = CGAffineTransformIdentity;
            
        }completion:^(BOOL finished) {
            
            self.flag = 0;
            //self.rightView.hidden = YES;
            
        }];
    }
    
    

    
}
#pragma mark  右边栏的点击事件
- (void)MainRightViewMenuDidChick:(MainRightView  *)orderContent withIndex:(NSInteger )index{
    
    [UIView animateWithDuration:kDuration animations:^{
        
        self.view.transform=CGAffineTransformIdentity;
        self.rightView.transform = CGAffineTransformIdentity;
        
    }completion:^(BOOL finished) {
        
        self.flag = 0;
        //self.rightView.hidden = YES;
        
    }];
    
    switch (index) {
        case 0: //点菜管理
        {
            OrderingViewController *vc=  [[OrderingViewController alloc]init];
            
            [self switchViewController:vc];
            
        }
    
        break;
        case 1: //餐台管理
        {
            DinnerTableViewController *vc=  [[DinnerTableViewController alloc]init];
            
            [self switchViewController:vc];
            
        }

        break;
        case 2: //零售管理
        {
            LingShouViewController *lingCtrl=  [[LingShouViewController alloc]init];
            
            [self switchViewController:lingCtrl];
            
        }
        break;
        default:
        break;
    }
    
       
    
    
}

#pragma mark  左边栏的点击事件
- (void)MainLeftViewMenuDidChick:(MainLeftView  *)orderContent withIndex:(NSInteger )index{
    
    [UIView animateWithDuration:kDuration animations:^{
        
        self.view.transform=CGAffineTransformIdentity;
        self.leftView.transform = CGAffineTransformIdentity;
    }completion:^(BOOL finished) {
        
        self.flag = 0;
        //self.leftView.hidden = YES;
        
    }];
    
    switch (index) {
        case 0: //预订管理
        {
            BookingManagerViewController *vc=  [[BookingManagerViewController alloc]init];
            
            [self switchViewController:vc];
            
        }
        break;
            
        case 1://订单记录
        {
            TradeViewController *tradeCtrl=  [[[NSBundle mainBundle]loadNibNamed:@"TradeViewController" owner:nil options:nil]lastObject];
            
            [self switchViewController:tradeCtrl];
            
        }
        break;
        case 2://数据报告
        {
            TradeViewController *tradeCtrl=  [[[NSBundle mainBundle]loadNibNamed:@"TradeViewController" owner:nil options:nil]lastObject];
            
            [self switchViewController:tradeCtrl];
            
        }
            break;
        case 3://会员管理
        {
            VipViewController *vipVC= [[[NSBundle mainBundle]loadNibNamed:@"VipViewController" owner:nil options:nil]lastObject];
            [self switchViewController:vipVC];
            
        }
            break;
        case 4://系统设置
        {
            BaseSettingsViewController *vc=  [[BaseSettingsViewController alloc]init];
            
            [self switchViewController:vc];
            
        }
            break;
        default:
            break;
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
