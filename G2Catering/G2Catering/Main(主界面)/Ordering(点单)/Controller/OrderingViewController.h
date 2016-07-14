//
//  OrderingViewController.h
//  G2Catering
//
//  Created by wd on 16/6/12.
//  Copyright © 2016年 NDL. All rights reserved.
//
#import "ShowGoodsView.h"
#import <UIKit/UIKit.h>

@interface OrderingViewController : UIViewController<ShowGoodsViewViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

@end
