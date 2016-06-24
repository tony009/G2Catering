//
//  WaiMaiTableViewCell.m
//  G2Catering
//
//  Created by tencrwin on 16/6/21.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "WaiMaiTableViewCell.h"
#import "WaiMaiDetailTableViewCell.h"
@implementation WaiMaiTableViewCell

- (void)awakeFromNib {
    // Initialization code
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [_tableView registerNib:[UINib nibWithNibName:@"WaiMaiDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"WaiMaiDetailTableViewCell"];
    

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
     WaiMaiDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WaiMaiDetailTableViewCell" forIndexPath:indexPath];
    
    return cell;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
