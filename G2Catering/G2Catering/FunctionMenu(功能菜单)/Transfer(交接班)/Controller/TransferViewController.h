//
//  TransferViewController.h
//  G2Catering
//
//  Created by tencrwin on 16/6/16.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYPieChart.h"
@interface TransferViewController : UIViewController
@property (weak, nonatomic) IBOutlet XYPieChart *pieView;

@property (weak, nonatomic) IBOutlet UIView *rightView;

@end
