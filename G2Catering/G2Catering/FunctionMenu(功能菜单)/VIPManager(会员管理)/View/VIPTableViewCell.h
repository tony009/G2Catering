//
//  VIPTableViewCell.h
//  G2Catering
//
//  Created by iOS  on 16/6/15.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UserModel.h"

@interface VIPTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UISwitch *switchView;


@property (strong,nonatomic)UserModel *model;

@end
