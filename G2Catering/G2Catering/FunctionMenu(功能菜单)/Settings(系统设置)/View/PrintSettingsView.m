//
//  PrintSettingsView.m
//  G2Catering
//
//  Created by NDlan on 16/6/14.
//  Copyright © 2016年 NDL. All rights reserved.
//

#import "PrintSettingsView.h"
#import "PrintSettingTableViewCell.h"
@interface PrintSettingsView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation PrintSettingsView



- (void)awakeFromNib{
    
    [self.addBtn addTarget:self action:@selector(didClickAddBtn) forControlEvents:UIControlEventTouchUpInside];
    
    self.tableView.delegate    = self;
    self.tableView.dataSource  = self;
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    [self.tableView registerNib:[UINib nibWithNibName:@"PrintSettingTableViewCell" bundle:nil] forCellReuseIdentifier:@"printtSettingCell"];
    
}


- (void)didClickAddBtn{
    
    NSLog(@"%s",__func__);
    
}

#pragma mark -UITableViewDelegate,UITableViewDataSource

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    PrintSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"printtSettingCell"];
    
    return cell;
}


- (nullable NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewRowAction *action = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        
        NSLog(@"删除");
        
    }];
    
    action.backgroundColor = [UIColor colorWithRed:42/255.0f green:66/255.0f blue:90/255.0f alpha:1];
    
    return @[action];
}



- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return YES;
}



@end
