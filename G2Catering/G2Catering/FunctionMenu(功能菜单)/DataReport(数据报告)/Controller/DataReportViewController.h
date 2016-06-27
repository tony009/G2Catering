//
//  DataReportViewController.h
//  G2Catering
//
//  Created by NDlan on 16/6/27.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataReportViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *todayBtn;
@property (weak, nonatomic) IBOutlet UIButton *weekBtn;
@property (weak, nonatomic) IBOutlet UIButton *monthBtn;

@property (strong, nonatomic) IBOutlet UIView *bigBackView;

@property (weak, nonatomic) IBOutlet UIButton *startDataBtn;
@property (weak, nonatomic) IBOutlet UIButton *endDataBtn;
@property (weak, nonatomic) IBOutlet UIButton *selectDateBtn;



@end
