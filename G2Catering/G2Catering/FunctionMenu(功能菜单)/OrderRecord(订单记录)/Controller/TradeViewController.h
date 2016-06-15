//
//  TradeViewController.h
//  G2Catering
//
//  Created by iOS  on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TradeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *historyTable;
@property (weak, nonatomic) IBOutlet UITableView *typeTable;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UIButton *endDate;
@property (weak, nonatomic) IBOutlet UIButton *startDate;
@property (weak, nonatomic) IBOutlet UITextField *startText;
@property (weak, nonatomic) IBOutlet UITextField *endText;
@property (weak, nonatomic) IBOutlet UIButton *selectBtn;
@property(nonatomic,strong)UIView *wholeView;

@end
