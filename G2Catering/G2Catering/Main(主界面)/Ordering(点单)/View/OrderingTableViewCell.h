//
//  OrderingTableViewCell.h
//  G2Catering
//
//  Created by wd on 16/6/15.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderingTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *dishName; //菜名

@property (weak, nonatomic) IBOutlet UILabel *dishPrice; //菜价
@property (weak, nonatomic) IBOutlet UILabel *dishNumberLabel;


@end
