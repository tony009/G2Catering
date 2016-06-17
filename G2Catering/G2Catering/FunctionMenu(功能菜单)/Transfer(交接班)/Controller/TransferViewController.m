//
//  TransferViewController.m
//  G2Catering
//
//  Created by tencrwin on 16/6/16.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "TransferViewController.h"

@interface TransferViewController ()<XYPieChartDelegate,XYPieChartDataSource>{
    UILabel *_blueLabel;
     UILabel *_yellowLabel;
}

@end

@implementation TransferViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.rightView.layer.borderWidth = 1;
    self.rightView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.pieView.layer.borderWidth = 1;
    self.pieView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    [self initView];
    
 
}

- (void)initView{
    
    [self.pieView setDataSource:self];
    [self.pieView setStartPieAngle:M_PI_2];
    [self.pieView setAnimationSpeed:2.0];
    [self.pieView setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:16]];
    [self.pieView setLabelRadius:10];
    [self.pieView setShowPercentage:YES];
    [self.pieView setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
    [self.pieView setPieCenter:CGPointMake(159, 125)];
    [self.pieView setUserInteractionEnabled:NO];
    //    [self.pieView setLabelShadowColor:[UIColor blackColor]];
    [self.pieView setPieRadius:75];
    [self.pieView setLabelColor:[UIColor blackColor]];
    
    //设置中心圆
    UILabel *label = [[UILabel alloc] init];
    CGRect frame = CGRectMake(0, 0, 95, 95);
    label.frame = frame;
    //    label.width = 95;
    //    label.height = 95;
    label.center = CGPointMake(159, 125);
    label.backgroundColor = [UIColor whiteColor];
    label.layer.cornerRadius = 95/ 2;
    label.layer.masksToBounds = YES;
    _blueLabel= [[UILabel alloc]initWithFrame:CGRectMake(7, 7, 80, 40)];
    _blueLabel.textColor = [UIColor colorWithRed:78/255.0 green:152/255.0 blue:226/255.0 alpha:1];
    _blueLabel.textAlignment = NSTextAlignmentCenter;
    //    blueLabel.backgroundColor = [UIColor blueColor];
    [label addSubview:_blueLabel];
    _yellowLabel = [[UILabel alloc]initWithFrame:CGRectMake(7, 47, 80, 40)];
    //    blackLabel.backgroundColor = [UIColor yellowColor];
    _yellowLabel.textColor = [UIColor  blackColor];
    _yellowLabel.textAlignment = NSTextAlignmentCenter;
    [label addSubview:_yellowLabel];
    [self.pieView addSubview:label];
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
