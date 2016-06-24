//
//  WaiMaiTableViewCell.h
//  G2Catering
//
//  Created by tencrwin on 16/6/21.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaiMaiTableViewCell : UITableViewCell<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end
