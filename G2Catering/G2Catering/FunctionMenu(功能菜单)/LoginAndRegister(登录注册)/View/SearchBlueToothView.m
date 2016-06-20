//
//  SearchBlueToothView.m
//  G2Catering
//
//  Created by NDlan on 16/6/20.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "SearchBlueToothView.h"
#import "BlueToothDeviceTableViewCell.h"
@interface SearchBlueToothView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation SearchBlueToothView
static NSString *reuserID = @"BlueToothDeviceTableViewCell";
- (void)awakeFromNib{
    
    self.searchViewBackView.layer.cornerRadius  = 5;
    self.searchViewBackView.layer.masksToBounds = YES;
    
    self.sureBtn.layer.cornerRadius  = 5;
    self.sureBtn.layer.masksToBounds = YES;
    
    self.deviceTableView.delegate   = self;
    self.deviceTableView.dataSource = self;
    
    [self.deviceTableView registerNib:[UINib nibWithNibName:@"BlueToothDeviceTableViewCell" bundle:nil] forCellReuseIdentifier:reuserID];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    BlueToothDeviceTableViewCell *cell = (BlueToothDeviceTableViewCell *)[tableView dequeueReusableCellWithIdentifier:reuserID forIndexPath:indexPath];
    
    return cell;
    
}

@end
