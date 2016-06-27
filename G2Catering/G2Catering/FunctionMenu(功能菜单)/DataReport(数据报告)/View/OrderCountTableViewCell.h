//
//  OrderCountTableViewCell.h
//  G2Catering
//
//  Created by NDlan on 16/6/27.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderCountTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *categoryName;
@property (weak, nonatomic) IBOutlet UILabel *orderNum;
@property (weak, nonatomic) IBOutlet UILabel *percentLabel;

@end
